package com.example.miniproj2.contoller;

import com.example.miniproj2.entity.Board;
import com.example.miniproj2.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardRepository boardRepository;

    @GetMapping("/list")
    public String list(Model model){
        List<Board> bords =boardRepository.findAll();

        model.addAttribute("list", bords);

        return "/board/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model){
        Board board = boardRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("id가 존재하지 않습니다."));

        model.addAttribute("board", board);

        return "/board/detail";
    }

    @GetMapping("/write")
    public String writeForm(@ModelAttribute("board") Board board){
        return "/board/write";
    }

    @PostMapping("/write")
    public String write(
            @RequestParam("writer") String writer,
            @RequestParam("title") String title,
            @RequestParam("content") String content

    ){
        Board board = Board.builder()
                .writer(writer)
                .title(title)
                .content(content)
                .build();

        Board result = boardRepository.save(board);

        log.info("Saved board: {}", result); // 저장된 Board 객체 확인

//        return "redirect:/board/list";

        return "redirect:/board/detail?id=" + result.getId();
    }

    @GetMapping("/edit")
    public String edit(@RequestParam long id, Model model){
        Board board = boardRepository.findById(id).orElseThrow();

        model.addAttribute("board", board);

        return "/board/edit";
    }

    @PostMapping("/edit")
    public String edit(
            @RequestParam("id") Long id,
            @RequestParam("title") String title,
            @RequestParam("writer") String writer,
            @RequestParam("content") String content){

        Board origin = boardRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("id가 존재하지 않습니다."));
        origin.setTitle(title);
        origin.setWriter(writer);
        origin.setContent(content);

        boardRepository.save(origin);

        return "redirect:/board/list";

    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") long id){
        boardRepository.deleteById(id);

        return "redirect:/board/list";
    }
}
