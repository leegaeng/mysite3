package com.sds.icto.mysite.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.mysite.domain.MemberVo;
import com.sds.icto.mysite.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberSev;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinform";

	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVo vo) {
		System.out.println(vo);
		memberSev.joinUser(vo);
		return "redirect:login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginform";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberVo vo, HttpSession session) {
		MemberVo m = memberSev.authUser(vo);
		if (m == null) {
			return "redirect:/member/login?result=fail";

		} else {
			session.setAttribute("authMember", m);
			return "redirect:/index";
		}
	}

	@RequestMapping("/uinfo")
	public String uinfo(HttpSession session, Model m) {

		MemberVo vo = (MemberVo) session.getAttribute("authMember");
		m.addAttribute("m", vo);

		return "member/uinfo";

	}

	@RequestMapping("/update")
	public String update(@ModelAttribute MemberVo vo) {

		memberSev.updateUser(vo);

		return "redirect:/index";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authMember");

		return "redirect:/index";
	}

	@RequestMapping(value="/checkEmail/{email}", method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(@PathVariable("email") String email) {

		String result = null;
		MemberVo vo = new MemberVo();
		vo.setEmail(email);

		vo = memberSev.authUser(vo);
		if (vo == null) {
			result = "true";
		} else {
			result = "false";
		}

		return result;
	}
}
