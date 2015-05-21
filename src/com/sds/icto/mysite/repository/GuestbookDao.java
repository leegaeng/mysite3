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

import com.sds.icto.mysite.domain.GuestbookVo;
import com.sds.icto.mysite.exception.GuestbookDaoException;

@Repository
public class GuestbookDao {

	@Autowired
	SqlMapClientTemplate st;

	public void insert(GuestbookVo g) {
		st.insert("guestbook.insert", g);
	}

	public void delete(GuestbookVo g) {
		st.delete("guestbook.delete", g);
	}

	public List<GuestbookVo> fetchList() {
		@SuppressWarnings("unchecked")
		List<GuestbookVo> list = st.queryForList("guestbook.get");
		return list;
	}

}
