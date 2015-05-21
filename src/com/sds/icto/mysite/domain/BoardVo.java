package com.sds.icto.mysite.domain;

public class BoardVo {

	private long no;
	private String title;
	private String content;
	private long member_no;
	private String member_name;
	private long view_cnt;
	private String reg_date;

	public BoardVo() {
	};

	public BoardVo(String title, String content, long member_no,
			String member_name) {
		this.title = title;
		this.content = content;
		this.member_no = member_no;
		this.member_name = member_name;

	}

	public BoardVo(long no, String title, String content, long member_no,
			String member_name, long view_cnt, String reg_date) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.member_no = member_no;
		this.member_name = member_name;
		this.view_cnt = view_cnt;
		this.reg_date = reg_date;
	}

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getMember_no() {
		return member_no;
	}

	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public long getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(long view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BoardVo [no=");
		builder.append(no);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", member_no=");
		builder.append(member_no);
		builder.append(", member_name=");
		builder.append(member_name);
		builder.append(", view_cnt=");
		builder.append(view_cnt);
		builder.append(", reg_date=");
		builder.append(reg_date);
		builder.append("]");
		return builder.toString();
	}

}
