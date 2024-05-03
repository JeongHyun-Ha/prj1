package com.prj1.controller;

import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService service;

    @GetMapping("/signup")
    public String signupForm() {
        return "member/signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute Member member) {
        service.signup(member);
        return "redirect:/member/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("")
    public String info(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
        return "member/info";
    }

    @PostMapping("/delete")
    public String delete(Integer id, Model model) {
        int deleted = service.delete(id);
        log.info("id={}, deleted={}", id, deleted);
        model.addAttribute("deleteMember", deleted);
        return "redirect:/member/list";
    }

    @GetMapping("/update")
    public String updateForm(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
        return "member/update";
    }

    @PostMapping("/update")
    public String update(Member member, RedirectAttributes rttr) {
        int updated = service.update(member);

        rttr.addAttribute("id", member.getId());
        rttr.addFlashAttribute("updated", updated);
        return "redirect:/member";
    }

    @ResponseBody
    @GetMapping("/email")
    public String emailCheck(String email) {
        return service.emailCheck(email);
    }
    
    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }
}
