package com.front.board.domain;

import java.util.Map;

public class Board {
	private String seq_board;
	private String seq_member;
	private String member_name;
	private String member_image_url;
	private String seq_group;
	private String seq_category;
	private String title;
	private String contents;
	private String read_count;
	private String tags;
	private String like_cnt;
	private String image_url;
	
	public String getSeq_board() {
		return seq_board;
	}
	public void setSeq_board(String seq_board) {
		this.seq_board = seq_board;
	}
	public String getSeq_member() {
		return seq_member;
	}
	public void setSeq_member(String seq_member) {
		this.seq_member = seq_member;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_image_url() {
		return member_image_url;
	}
	public void setMember_image_url(String member_image_url) {
		this.member_image_url = member_image_url;
	}
	public String getSeq_group() {
		return seq_group;
	}
	public void setSeq_group(String seq_group) {
		this.seq_group = seq_group;
	}
	public String getSeq_category() {
		return seq_category;
	}
	public void setSeq_category(String seq_category) {
		this.seq_category = seq_category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRead_count() {
		return read_count;
	}
	public void setRead_count(String read_count) {
		this.read_count = read_count;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(String like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	@Override
	public String toString() {
		return "Board [seq_board=" + seq_board + ", seq_member=" + seq_member + ", member_name=" + member_name
				+ ", member_image_url=" + member_image_url + ", seq_group=" + seq_group + ", seq_category="
				+ seq_category + ", title=" + title + ", contents=" + contents + ", read_count=" + read_count
				+ ", tags=" + tags + ", like_cnt=" + like_cnt + ", image_url=" + image_url + ", getSeq_board()="
				+ getSeq_board() + ", getSeq_member()=" + getSeq_member() + ", getMember_name()=" + getMember_name()
				+ ", getMember_image_url()=" + getMember_image_url() + ", getSeq_group()=" + getSeq_group()
				+ ", getSeq_category()=" + getSeq_category() + ", getTitle()=" + getTitle() + ", getContents()="
				+ getContents() + ", getRead_count()=" + getRead_count() + ", getTags()=" + getTags()
				+ ", getLike_cnt()=" + getLike_cnt() + ", getImage_url()=" + getImage_url() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}


