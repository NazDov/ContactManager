package net.schastny.contactmanager.service;
 
import java.util.List;
 


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 


import net.schastny.contactmanager.dao.ContactDAO;
import net.schastny.contactmanager.domain.Contact;
 
@Service
public class ContactServiceImpl implements ContactService {
 
    @Autowired
    private ContactDAO contactDAO;
 
    @Transactional
    public void addContact(Contact contact) {
        contactDAO.addContact(contact);
    }
 
    @Transactional
    public List<Contact> listContact() {
 
        return contactDAO.listContact();
    }
 
    @Transactional
    public void removeContact(Integer id) {
        contactDAO.removeContact(id);
    }

	@Override
	@Transactional
	public void updateContact(Contact contact) {
		contactDAO.updateContact(contact);
		
	}
	
	@Override
	@Transactional
	public Contact getContactById(Integer id) {
		// TODO Auto-generated method stub
		return contactDAO.getContactById(id);
	}

	@Override
	@Transactional
	public List<Contact> getContactsByValue(String value) {
		// TODO Auto-generated method stub
		return contactDAO.getContactsByValue(value);
	}
}
