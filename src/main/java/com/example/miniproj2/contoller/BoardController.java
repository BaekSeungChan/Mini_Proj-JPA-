package com.example.miniproj2.contoller;

import com.example.miniproj2.entity.Board;
import com.example.miniproj2.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardRepository boardRepository;

    @GetMapping("/list")
    public String list(){
        return "/board/list";
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

        return "redirect:/board/list";
    }

}
