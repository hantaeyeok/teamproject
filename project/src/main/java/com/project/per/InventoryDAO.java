package com.project.per;

import java.util.List;

import com.project.domain.Inventory;

public interface InventoryDAO {
	List<Inventory> getInventoryList();
    Inventory getInventory(int ino);
    void insInventory(Inventory inventory);
    void upInventory(Inventory inventory);
    void delInventory(int ino);
}
