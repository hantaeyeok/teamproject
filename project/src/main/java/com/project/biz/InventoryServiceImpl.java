package com.project.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Inventory;
import com.project.per.InventoryDAO;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	private InventoryDAO inventoryDAO;
	
	@Override
    public List<Inventory> getInventoryList() {
        return inventoryDAO.getInventoryList();
    }

    @Override
    public Inventory getInventory(int ino) {
        return inventoryDAO.getInventory(ino);
    }

    @Override
    public void insInventory(Inventory inventory) {
    	inventoryDAO.insInventory(inventory);
    }

    @Override
    public void upInventory(Inventory inventory) {
    	inventoryDAO.upInventory(inventory);
    }

    @Override
    public void delInventory(int ino) {
    	inventoryDAO.delInventory(ino);
    }
	
}
