package himedia.photobook.services.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import himedia.photobook.controllers.DataConverter;
import himedia.photobook.repositories.dao.OrdersDaoImpl;
import himedia.photobook.repositories.dao.RefundDaoImpl;
import himedia.photobook.repositories.dao.ShipmentsDaoImpl;
import himedia.photobook.repositories.dao.UsersDaoImpl;
import himedia.photobook.repositories.vo.OrdersVo;
import himedia.photobook.repositories.vo.ShipmentsVo;
import himedia.photobook.repositories.vo.UsersVo;

@Service("adminDeliveryService")
public class AdminDeliveryServiceImpl {
	private DataConverter dataConverter = new DataConverter();
	
	@Autowired
	private OrdersDaoImpl orderDao;
	@Autowired
	private UsersDaoImpl userDao;
	@Autowired
	private ShipmentsDaoImpl shipmentsDao;
	@Autowired
	private RefundDaoImpl refundDao;
	
	/**
	 * 배송 관리에 필요한 정보들을 모두 리턴해주는 함수
	 * */
	public List<Map<String, Object>> getDeliveryInfos(){
		List<Map<String, Object>> deliveryInfoList = new ArrayList<Map<String, Object>>();
		Map<String, Object> deliveryInfos = null;
		UsersVo usersVo = null;
		ShipmentsVo shipmentsVo = null;  
		String status = null;
		
		// 주문이 들어오면 무조건 배송 테이블이 생긴다
		// 그래서 order가 기준
		List<OrdersVo> orderList = orderDao.selectAllOrders();
		
		for (OrdersVo ordersVo : orderList) {
			deliveryInfos = new HashMap<String, Object>();	
			usersVo = userDao.selectUserByUserId(ordersVo.getUserId());
			shipmentsVo = shipmentsDao.selectShipmentInfoByOrderID(
					ordersVo.getOrderId());
			
			status = shipmentsVo.getShipmentStatus();
			if(status.equals("R"))	
				status = refundDao.selectStatusByOrderID(shipmentsVo.getOrderId());
			status = dataConverter.statusToWord(status);
			
			deliveryInfos.put("ordersVo", ordersVo);
			deliveryInfos.put("usersVo", usersVo);
			deliveryInfos.put("shipmentsVo", shipmentsVo);
			deliveryInfos.put("status", status);
			
			deliveryInfoList.add(deliveryInfos);
		}
		
		return deliveryInfoList;
	}
}
