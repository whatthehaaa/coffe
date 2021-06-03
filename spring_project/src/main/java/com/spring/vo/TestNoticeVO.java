
package com.spring.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class TestNoticeVO {
	int rno, nhits;

	String nid, ntitle, ncontent, nfile_t, nsfile_t, nfile, nsfile, ndate ;
	CommonsMultipartFile file1;
	CommonsMultipartFile file2;
	

	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNhits() {
		return nhits;
	}
	public void setNhits(int nhits) {
		this.nhits = nhits;
	}
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNfile_t() {
		return nfile_t;
	}
	public void setNfile_t(String nfile_t) {
		this.nfile_t = nfile_t;
	}
	public String getNsfile_t() {
		return nsfile_t;
	}
	public void setNsfile_t(String nsfile_t) {
		this.nsfile_t = nsfile_t;
	}
	public String getNfile() {
		return nfile;
	}
	public void setNfile(String nfile) {
		this.nfile = nfile;
	}
	public String getNsfile() {
		return nsfile;
	}
	public void setNsfile(String nsfile) {
		this.nsfile = nsfile;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	public CommonsMultipartFile getFile2() {
		return file2;
	}
	public void setFile2(CommonsMultipartFile file2) {
		this.file2 = file2;
	}
	
	
	
}
