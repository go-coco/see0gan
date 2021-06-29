package com.see0gan.payment.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.see0gan.payment.dao.PaymentDAO;
import com.see0gan.payment.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	private Logger logger = Logger.getLogger(PaymentService.class);
	
	private PaymentDAO paymentDAO;
	@Autowired(required=false)
	public PaymentServiceImpl(PaymentDAO paymentDAO) {
		this.paymentDAO = paymentDAO;
		
	}
	
	@Override
	public int paymentInsert(PaymentVO pvo) {
		
		logger.info("PaymentServiceImpl paymentInsert 함수 진입 >>>");
		return paymentDAO.paymentInsert(pvo);
	}

	@Override
	public List<PaymentVO> paymentSelect(PaymentVO pvo) {
		return paymentDAO.paymentSelect(pvo);
	}

}
