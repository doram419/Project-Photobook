package himedia.photobook.services.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import himedia.photobook.repositories.dao.AlbumDao;
import himedia.photobook.repositories.dao.AlbumPhotoDao;
import himedia.photobook.repositories.dao.InventoryDao;
import himedia.photobook.repositories.vo.AlbumPhotoVo;
import himedia.photobook.repositories.vo.AlbumVo;
import himedia.photobook.repositories.vo.InventoryVo;
import himedia.photobook.repositories.vo.PhotoVo;
import himedia.photobook.tools.FileModule;

@Service
public class AdminProductService {
	@Autowired
	private AlbumDao albumDaoImpl;
	@Autowired
	private InventoryDao inventoryDaoImpl;
	@Autowired
	private AlbumPhotoDao albumPhotoDaoImpl;
	private FileModule fileModule = new FileModule();
	private static String DEFUALT_PATH = "C:/photobook/album/";
	
	// 앨범 및 가격 목록
	public List<AlbumVo> searchAlbum(String searchCategory, String keyword) {
		return albumDaoImpl.searchAlbum(keyword);
	}

	public List<InventoryVo> listInventory() {
		return inventoryDaoImpl.listInventory();
	}

	/**
	 * 제품 관리에 필요한 정보
	 */


	public boolean updateAlbum(AlbumVo vo) {
		int updatedCount = albumDaoImpl.updateAlbum(vo);
		return updatedCount == 1;
	}

	public int insertAlbum(AlbumVo vo) {
		return albumDaoImpl.insertAlbum(vo);
	}
    
    /**
   * 제품 관리에 필요한 정보
   * */
    public List<Map<String, Object>>getProductInfos() {
    	List<Map<String, Object>> productInfoList = new ArrayList<Map<String, Object>>();
    	List<AlbumVo> albumlist = albumDaoImpl.selectAll();
    	
    	for(AlbumVo albumVo : albumlist) {
    		Map<String, Object> productMap = new HashMap<String, Object>();
    		InventoryVo inventoryVo = inventoryDaoImpl.selectOneByAlbumId(albumVo.getAlbumId());
    		
    		productMap.put("albumVo", albumVo);
    		productMap.put("inventoryVo", inventoryVo);
    		
    		productInfoList.add(productMap);
    		
    	}
    	
    	return productInfoList;
    }
    
    /**
     * 제품 관리에 필요한 정보
     * */
      public List<Map<String, Object>>getProductInfos(String keyword) {
      	List<Map<String, Object>> productInfoList = new ArrayList<Map<String, Object>>();
      	List<AlbumVo> albumlist = albumDaoImpl.searchAlbum(keyword);
      	
      	for(AlbumVo albumVo : albumlist) {
      		Map<String, Object> productMap = new HashMap<String, Object>();
      		InventoryVo inventoryVo = inventoryDaoImpl.selectOneByAlbumId(albumVo.getAlbumId());
      		
      		productMap.put("albumVo", albumVo);
      		productMap.put("inventoryVo", inventoryVo);
      		
      		productInfoList.add(productMap);
      		
      	}
      	
      	return productInfoList;
     }
    
    public Map<String, Object> getAlbumInfoMap(String albumId) {
        AlbumVo albumVo = albumDaoImpl.selectByAlbumId(albumId);
        InventoryVo inventory = inventoryDaoImpl.selectOneByAlbumId(albumId);
    	
        Map<String, Object> productMap = new HashMap<String, Object>();
        
        if (inventory != null) {
        	productMap.put("album", albumVo);
        	productMap.put("inventory", inventory);
        }

        return productMap;
    }
    
    public boolean updateProduct(AlbumVo albumVo, Long albumPrice) {
 		int updatedCount = albumDaoImpl.updateAlbum(albumVo);
 		InventoryVo inventoryVo = new InventoryVo();
 		inventoryVo.setAlbumPrice(albumPrice);
 		inventoryVo.setAlbumId(albumVo.getAlbumId());
 		
 		inventoryDaoImpl.updateProduct(inventoryVo);
 		return updatedCount == 1;
 	}
    
 	public boolean deleteProduct(String albumId) {
 		boolean result = 1 == inventoryDaoImpl.delete(albumId);
 		
    	return result && (1 == albumDaoImpl.delete(albumId));
	}
 	
 	public boolean insertProduct(AlbumVo albumVo, Long albumPrice, MultipartFile multipartFile) {
 		boolean result = false;
 		
 		int albumInsertedCount = albumDaoImpl.insertAlbum(albumVo);
 		
 		result = 1 == albumInsertedCount;
 		
 		InventoryVo inventoryVo = new InventoryVo();
 		inventoryVo.setAlbumId(albumVo.getAlbumId());
 		inventoryVo.setAlbumPrice(albumPrice);
 		inventoryVo.setaQuantity(0l);
 		int inventoryInsertedCount = inventoryDaoImpl.insertInventory(inventoryVo);
 		
 		result = result && (1 == inventoryInsertedCount);
 		
		AlbumPhotoVo albumPhotoVo = null;
 		
 		if(result) {
			String savePath = DEFUALT_PATH + albumVo.getAlbumId();
			String originalFileName = multipartFile.getOriginalFilename();
			
			String extName = originalFileName.substring(originalFileName.lastIndexOf(".")); 
			String photoPath = null;
			try {
				photoPath = fileModule.saveFile(multipartFile, savePath, "mainImg", extName);
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: 에러 연결하기
			}
			albumPhotoVo = new AlbumPhotoVo(null, albumVo.getAlbumId(), photoPath, "M");
			
			result = result && (1 == albumPhotoDaoImpl.insert(albumPhotoVo));
		}
 		
 		return result;
	}
}
