package com.sds.icto.mysite.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.mysite.domain.BoardVo;
import com.sds.icto.mysite.exception.BoardDaoException;

@Repository
public class BoardDao {

	@Autowired
	SqlMapClientTemplate st;

	public void insertBoard(BoardVo b) {
		st.insert("board.insert", b);
	}

	public void deleteBoard(long no) {
		st.delete("board.delete", no);
	}

	public void updateCount(BoardVo b) {
		st.update("board.updatecnt", b);
	}

	public void updateBoard(BoardVo b) {
		st.update("board.update", b);
	}

	public List<BoardVo> fetchList() {
		List<BoardVo> list = st.queryForList("board.list");

		return list;
	}

	public BoardVo fetchBoard(Long i) {
		BoardVo b = (BoardVo) st.queryForObject("board.get", i);
		return b;
	}

	public List<BoardVo> fetchBoard(String searchfield) {
		List<BoardVo> list = st.queryForList("board.search", searchfield);

		return list;
	}
}
