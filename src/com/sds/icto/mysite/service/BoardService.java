package com.sds.icto.mysite.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.mysite.domain.BoardVo;
import com.sds.icto.mysite.repository.BoardDao;

@Service
public class BoardService {

	@Autowired
	BoardDao boardDao;

	public List<BoardVo> listBoard() {

		List<BoardVo> list = new ArrayList<BoardVo>();
		list = boardDao.fetchList();

		return list;
	}

	public void insertBoard(BoardVo vo) {

		boardDao.insertBoard(vo);

	}

	public void updateBoard(BoardVo vo) {

		boardDao.updateBoard(vo);

	}

	public void updateCount(BoardVo vo) {

		boardDao.updateCount(vo);

	}

	public BoardVo fetchBoard(long no) {
		BoardVo v = boardDao.fetchBoard(no);
		return v;
	}

	public List<BoardVo> fetchBoard(String searchfield) {

		List<BoardVo> list = boardDao.fetchBoard(searchfield);
		return list;
	}

	public void deleteBoard(long no) {

		boardDao.deleteBoard(no);

	}

}
