package com.see0gan.login.service;

import java.util.List;

import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;

public interface LoginService {

	public List<GuestVO> guestSelectAll();
	public int memberInsert(GuestVO gvo);
	public List<GuestVO> getAccess(GuestVO gvo);
	public List<HostVO> getAccess(HostVO hvo);
	public int memberInsert(HostVO hvo);
	public int guestUpdate(GuestVO gvo);
	public int hostUpdate(HostVO gvo);
	public int guestDelete(GuestVO gvo);
	public int hostDelete(HostVO gvo);
}
