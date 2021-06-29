package com.see0gan.payment.dao;

import java.util.List;
import com.see0gan.payment.vo.PaymentVO;

public interface PaymentDAO {

	public int paymentInsert(PaymentVO pvo);
	
	public List<PaymentVO> paymentSelect(PaymentVO pvo);
}
