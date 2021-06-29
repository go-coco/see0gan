package com.see0gan.payment.dao;

import com.see0gan.payment.vo.PaymentVO;

import java.util.List;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	private Logger logger = Logger.getLogger(PaymentDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int paymentInsert(PaymentVO pvo) {
		
		return (Integer)sqlSession.insert("paymentInsert", pvo);
	}

	@Override
	public List<PaymentVO> paymentSelect(PaymentVO pvo) {
		return sqlSession.selectOne("paymentSelect",pvo);
	}
}
