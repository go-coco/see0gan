package com.see0gan.payment.service;

import java.util.List;
import com.see0gan.payment.vo.PaymentVO;

public interface PaymentService {
	
	public int paymentInsert(PaymentVO pvo);
	public List<PaymentVO> paymentSelect(PaymentVO pvo);
}