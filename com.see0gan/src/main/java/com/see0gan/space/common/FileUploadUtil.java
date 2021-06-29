package com.see0gan.space.common;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import com.oreilly.servlet.MultipartRequest;

public class FileUploadUtil {
	
	private String imgfilePaths;
	private int imgfileSize; 
	private String encodeType;	
	private MultipartRequest mr;

	public FileUploadUtil() {
		this.imgfilePaths = CommonUtils.IMG_UPLOAD_PATH;; 
		this.imgfileSize = CommonUtils.IMG_FILE_SIZE;
		this.encodeType = CommonUtils.EN_CODE;			
	}
	
	public boolean imgfileUpload(HttpServletRequest req) {		
		boolean bool = imgfileUpload(req, imgfilePaths);		
		return bool;
	}
	
	public boolean imgfileUploadSize(HttpServletRequest req) {		
		boolean bool = imgfileUploadSize(req, imgfilePaths);		
		return bool;
	}

	public boolean imgfileUpload(HttpServletRequest req, String filePath) {
		boolean bool = false;
		try {
			mr = new MultipartRequest(req, filePath, imgfileSize, encodeType);
			System.out.println("mr >>> : " + mr);
			bool=true;
		}catch(Exception e) {
			System.out.println("imgfileUploadUtil.imgfileUpload() >>> : " + mr);			
		}		
		return bool;
	}
	
	public boolean imgfileUploadSize(HttpServletRequest req, String filePath) {
		
		 ServletContext context = req.getSession().getServletContext();
		 String realPath = context.getRealPath("/imgupload");
		
		
		boolean bool = false;
		try {
			mr = new MultipartRequest(req, realPath, imgfileSize, encodeType);
			System.out.println("mr >>> : " + mr);
			System.out.println("mr.getOriginalFileName(\"tbsp_img1\") >>> : " + mr.getOriginalFileName("tbsp_img1"));
			System.out.println("mr.getFilesystemName(\"tbsp_img1\") >>> : " + mr.getFilesystemName("tbsp_img1"));
			System.out.println("mr.getOriginalFileName(\"tbsp_img2\") >>> : " + mr.getOriginalFileName("tbsp_img2"));
			System.out.println("mr.getFilesystemName(\"tbsp_img2\") >>> : " + mr.getFilesystemName("tbsp_img2"));
			
			bool=true;						
		}catch(Exception e) {
			System.out.println("imgfileUploadUtil.imgfileUpload() >>> : " + mr);			
		}		
		return bool;
	}
	
	public String getParameter(String s){
		return mr.getParameter(s);
	}
	
	public String getFileName(String f){
		return mr.getFilesystemName(f);
	}
	
	public ArrayList<String> getFileNames(){
		@SuppressWarnings("unchecked")
		Enumeration<String> en = mr.getFileNames();
		ArrayList<String> a = new ArrayList<String>();
		
		while (en.hasMoreElements()){
			String f = en.nextElement().toString();
			a.add(mr.getFilesystemName(f));
		}		
		return a;
	}
}
