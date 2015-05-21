package com.sds.icto.mysite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sds.icto.mysite.domain.BoardVo;
import com.sds.icto.mysite.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardSev;

	@RequestMapping("/list")
	public String list(Model m) {
		List<BoardVo> list = boardSev.listBoard();
		m.addAttribute("list", list);

		return "board/list";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertForm() {

		return "board/insertform";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVo vo) {

		boardSev.insertBoard(vo);

		return "redirect:list";
	}

	@RequestMapping(value = "/boardview/{no}")
	public String boardView(@PathVariable long no, Model m) {

		BoardVo b = boardSev.fetchBoard(no);
		boardSev.updateCount(b);

		b = boardSev.fetchBoard(no);
		m.addAttribute("b", b);

		return "board/boardview";
	}

	@RequestMapping(value = "/update")
	public String update(@ModelAttribute BoardVo vo) {

		boardSev.updateBoard(vo);

		return "redirect:list";
	}

	@RequestMapping(value = "/delete/{no}")
	public String delete(@PathVariable long no) {

		boardSev.deleteBoard(no);

		return "redirect:/board/list";
	}

	@RequestMapping(value = "/search/{searchfield}")
	public String search(@PathVariable String searchfield, Model m) {
		
		if(searchfield == null){
			return "redirect:/board/list";
		}
		List<BoardVo> list = boardSev.fetchBoard(searchfield);

		m.addAttribute("list", list);

		return "board/list";
	}

}
