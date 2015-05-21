package com.sds.icto.mysite.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.mysite.domain.GuestbookVo;
import com.sds.icto.mysite.repository.GuestbookDao;

@Service
public class GuestbookService {

	@Autowired
	GuestbookDao guestbookDao;

	public List<GuestbookVo> listGuestbook() {
		List<GuestbookVo> list = new ArrayList<GuestbookVo>();
		list = guestbookDao.fetchList();

		return list;
	}

	public void insertGuestbook(GuestbookVo vo) {
		guestbookDao.insert(vo);

	}

	public void deleteGuestbook(GuestbookVo vo) {
		guestbookDao.delete(vo);
	}

}
