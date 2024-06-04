package com.project.biz;

import java.util.List;

import com.project.domain.Inventory;

public interface InventoryService {
	List<Inventory> getInventoryList();
	Inventory getInventory(int ino);
	void insInventory(Inventory inventory);
	void upInventory(Inventory inventory);
	void delInventory(int ino);
}
