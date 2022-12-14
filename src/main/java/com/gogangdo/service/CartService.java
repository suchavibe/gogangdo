package com.gogangdo.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.gogangdo.dto.CartDTO;
import com.gogangdo.mapper.CartMapper;

@Service
public class CartService {
	private CartMapper mapper;

	public CartService(CartMapper mapper) {
		this.mapper = mapper;
	}

	public List<CartDTO> selectCartView(String id) {
		return mapper.selectCartView(id);
	}

	public int selectCartCount() {
		return mapper.selectCartCount();
	}

	public int cartDelete(int cart_no) {
		return mapper.cartDelete(cart_no);
	}

	public int selectCartNo() {
		return mapper.selectCartNo();
	}

	public void insertCart(CartDTO dto) {
		mapper.insertCart(dto);
	}

	public void deleteAllCart(String id) {
		mapper.deleteAllCart(id);
	}

//	public int selectCartPrice() {
//		return mapper.selectCartPrice();
//	}

//	public int selectTotalPrice() {
//		return mapper.selectTotalPrice();
//	}




}