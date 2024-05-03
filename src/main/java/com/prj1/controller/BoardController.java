package com.prj1.controller;

import com.prj1.domain.Board;
import com.prj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardService service;

    @GetMapping("/add")
    public String addForm() {
        return "board/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Board board, Authentication authentication, RedirectAttributes rttr) {
        service.add(board, authentication);

        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }

    @GetMapping("/board")
    public String view(Integer id, Model model) {
        Board board = service.getBoard(id);
        model.addAttribute("board", board);
        log.info("board={}", board);
        return "board/view";
    }

    @GetMapping("/")
    public String home(@RequestParam(defaultValue = "1") Integer page, Model model) {

        model.addAllAttributes(service.list(page));
        return "board/home";
    }

    @PostMapping("/delete")
    public String delete(Integer id, Authentication authentication, RedirectAttributes rttr) {
        if (service.hasAccess(id, authentication)) {
            service.delete(id);
        }

        rttr.addFlashAttribute("deleteId", id);
        return "redirect:/";
    }

    @GetMapping("/update")
    public String updateForm(Integer id, Model model) {
        model.addAttribute("board", service.getBoard(id));

        return "board/update";
    }

    @PostMapping("/update")
    public String update(Board board, Authentication authentication, RedirectAttributes rttr) {

        if (service.hasAccess(board.getId(), authentication)) {
            service.update(board);
        }
        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }
}

