package net.schastny.contactmanager.service;

import java.util.Comparator;
import java.util.List;

import net.schastny.contactmanager.domain.Contact;

public class ApplicationServiceImpl implements ApplicationService<Contact>{

	
	public List<Contact> sortByNameDesc(List<Contact> listContact) {
		
		listContact.sort(new Comparator<Contact>(){


			@Override
			public int compare(Contact obj1, Contact obj2) {
				
				if(obj1.getLastname().compareToIgnoreCase(obj2.getLastname())>0){
					
					return 1;
					
				}else if(obj1.getLastname().compareToIgnoreCase(obj2.getLastname())<0){
					
					return -1;
					
				}else{
					return 0;
				}
				
			}
			
			
			
		});
		
		
		
		
		return listContact;
	}

	@Override
	public List<Contact> sortByNameAsc(List<Contact> listContact) {
		
		listContact.sort(new Comparator<Contact>(){


			@Override
			public int compare(Contact obj1, Contact obj2) {
				
				if(obj1.getLastname().compareToIgnoreCase(obj2.getLastname())>0){
					
					return -1;
					
				}else if(obj1.getLastname().compareToIgnoreCase(obj2.getLastname())<0){
					
					return 1;
					
				}else{
					return 0;
				}
				
			}
			
			
			
		});
		
		
		return listContact;
	}

}
