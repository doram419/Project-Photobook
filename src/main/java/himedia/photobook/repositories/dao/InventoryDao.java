package himedia.photobook.repositories.dao;

import java.util.List;

import himedia.photobook.repositories.vo.InventoryVo;

public interface InventoryDao {
// albumid로 앨범 가격 조회
	
public InventoryVo findAlbumPriceByAlbumId(String albumId);

	// 앨범 가격 목록
/**
 * 	앨범 목록 가져오기
 * */
	public List<InventoryVo> listInventory();
	public int updateAlbum(InventoryVo vo);
	/**
	 * 파라미터로 들어오는 inventoryVo의 albumId와 일치하는 튜플을 찾아,
	 * 그 개수(quantity)를 바꿔주는 메서드
	 * Param : InventoryVo inventoryVo - 경감시킬 albumId와 개수가 든 inventoryVo
	 * return : 영향 받은 튜플 수
	 * */
	public int updateQuantity(InventoryVo inventoryVo);
	/**
	 * albumId로 Inventory를 가져오는 메서드
	 * Param : String albumId - albumId와 일치하는 Inventory 튜플을 가져옴
	 * return : InventoryVo - 일치하는 튜플
	 * */
	public InventoryVo selectOneByAlbumId(String albumId);



	
}

