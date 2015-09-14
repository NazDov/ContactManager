package net.schastny.contactmanager.dao;

import java.util.List;
import net.schastny.contactmanager.domain.Contact;

public interface ContactDAO {

	public void addContact(Contact contact);

	public List<Contact> listContact();

	public void removeContact(Integer id);
	
	public void updateContact(Contact contact);
	
	public Contact getContactById(Integer id);
	
	public List<Contact> getContactsByValue(String name);
}