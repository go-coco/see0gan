package com.see0gan.login.dao;

import java.util.List;

import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;

public interface LoginDAO {

	public List<GuestVO> guestSelectAll();
	public int guestInsert(GuestVO gvo);
	public int hostInsert(HostVO hvo);
	public List<GuestVO> getGuestAccess(GuestVO gvo);
	public List<HostVO> getHostAccess(HostVO hvo);
	public int guestUpdate(GuestVO gvo);
	public int hostUpdate(HostVO gvo);
	public int guestDelete(GuestVO gvo);
	public int hostDelete(HostVO gvo);

}
