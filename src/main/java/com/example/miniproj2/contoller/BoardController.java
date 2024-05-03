package com.example.miniproj2.contoller;

import com.example.miniproj2.dto.BoardSearchDTO;
import com.example.miniproj2.entity.Board;
import com.example.miniproj2.repository.BoardRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardRepository boardRepository;

    @GetMapping("/list")
    public String list(Model model, BoardSearchDTO boardSearchDTO) {

        List<Board> searchResult;

        if (boardSearchDTO.getId() != null) {
            searchResult = Collections.singletonList(boardRepository.findById(boardSearchDTO.getId()).orElse(null));
        } else if (boardSearchDTO.getTitle() != null && !boardSearchDTO.getTitle().isEmpty()) {
            searchResult = boardRepository.findAllByTitleContaining(boardSearchDTO.getTitle());
        } else if (boardSearchDTO.getContent() != null && !boardSearchDTO.getContent().isEmpty()) {
            searchResult = boardRepository.findAllByContentContaining(boardSearchDTO.getContent());
        } else if (boardSearchDTO.getWriter() != null && !boardSearchDTO.getWriter().isEmpty()) {
            searchResult = boardRepository.findAllByWriterContaining(boardSearchDTO.getWriter());
        } else {
            searchResult = boardRepository.findAllByOrderByIdDesc();
        }


        model.addAttribute("list", searchResult);

        return "/board/list";
    }


    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model){
        Board board = boardRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("id가 존재하지 않습니다."));

        // 조회수 증가
        board.setReadCount(board.getReadCount()+1);
        Board result = boardRepository.save(board);

        model.addAttribute("board", board);

        return "/board/detail";
    }

    @GetMapping("/write")
    public String writeForm(@ModelAttribute("board") Board board){
        return "/board/write";
    }

    @PostMapping("/write")
    public String write(Board board){

        Board result = boardRepository.save(board);

        log.info("Saved board: {}", result); // 저장된 Board 객체 확인

//        return "redirect:/board/list";

        return "redirect:/board/detail?id=" + result.getId();
    }

    @GetMapping("/edit")
    public String edit(HttpServletRequest request, Model model){

        Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
        if(map == null) throw new RuntimeException("권한 없음");

        Long id = (Long)map.get("id");

        Board board = boardRepository.findById(id).orElseThrow();

        model.addAttribute("board", board);

        return "/board/edit";
    }

    @PostMapping("/edit")
    public String edit(
            @RequestParam("id") Long id,
            @RequestParam("title") String title,
            @RequestParam("writer") String writer,
            @RequestParam("content") String content,
            @RequestParam("password") String password
    ){

        Board origin = boardRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("id가 존재하지 않습니다."));
        origin.setTitle(title);
        origin.setWriter(writer);
        origin.setContent(content);
        origin.setPassword(password);

        boardRepository.save(origin);

        return "redirect:/board/list";

    }

    @GetMapping("/delete")
    public String delete(HttpServletRequest request){

        Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
        if(map == null) throw new RuntimeException("권한 없음");

        Long id = (Long)map.get("id");


        boardRepository.deleteById(id);

        return "redirect:/board/list";
    }

    @GetMapping("/password/{mode:edit|delete}/{id}")
    public String password(@PathVariable String mode, @PathVariable("id") long id, Model model){
        model.addAttribute("mode", mode);
        model.addAttribute("id", id);

        return "/board/password";
    }

    @PostMapping("/password/{mode:edit|delete}/{id}")
    public String password(@PathVariable String mode, @PathVariable long id, @RequestParam String password, RedirectAttributes attr){
        // 글번호가 없으면 오류 처리
        Board board = boardRepository.findById(id).orElseThrow();

        if(board.getPassword().equals(password)){
            attr.addFlashAttribute("id", id);
            return "redirect:/board/" + mode;
        }
        else {
            return "redirect:/board/password/" + mode + "/" + id + "?error";
        }
    }
}
