package com.prj1.controller;

import com.prj1.domain.Board;
import com.prj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardService service;

    @GetMapping("/add")
    public String boardForm() {
        return "board/add";
    }

    @PostMapping("/add")
    public String addBoardForm(@ModelAttribute Board board, RedirectAttributes rttr) {
        log.info("Board={}", board);

        service.add(board);
        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }

    @GetMapping("/board")
    public String viewBoard(Integer id, Model model) {
        Board board = service.getBoard(id);
        model.addAttribute("board", board);
        log.info("board={}", board);
        return "board/view";
    }

    @GetMapping("/")
    public String home(Model model) {
        List<Board> list = service.list();
        model.addAttribute("boardList", list);
        log.info("boardList={}", list);
        return "board/home";
    }
}

