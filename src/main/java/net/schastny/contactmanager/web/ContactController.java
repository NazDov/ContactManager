package net.schastny.contactmanager.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import net.schastny.contactmanager.domain.Contact;
import net.schastny.contactmanager.service.ApplicationService;
import net.schastny.contactmanager.service.ApplicationServiceImpl;
import net.schastny.contactmanager.service.ContactService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


@SessionAttributes(value={"contactId", "contactList", "foundContactList"})
@Controller
public class ContactController {
	
	public static Logger logger = Logger.getLogger(ContactController.class);

	@Autowired
	private ContactService contactService;

	@RequestMapping("/index")
	public String listContacts(Map<String, Object> map) {
		

		map.put("contact", new Contact());
		map.put("contactList", contactService.listContact());
		
		
		return "contact1";
	}
	
	
	@RequestMapping("/edit")
	public String showEditPage(@ModelAttribute("contactId") Integer contactId, Map<String, Object> map, SessionStatus status) {
		
		map.put("contact", contactService.getContactById(contactId));
		map.put("contactList", contactService.listContact());
		
	
		status.setComplete();
		
		return "contact1";
	}
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("contact") @Valid Contact contact, BindingResult result) {
		
		if(result.hasErrors()){
			
			logger.error("validation returned errors");
			return "contact1";
		}
		
		if(contact.getId()==0){
			
			contactService.addContact(contact);
	
		}else{
			contactService.updateContact(contact);
		}

		return "redirect:/index";
	}

	@RequestMapping("/delete/{contactId}")
	public String deleteContact(@PathVariable("contactId") Integer contactId) {

		contactService.removeContact(contactId);

		return "redirect:/index";
	}
	
	
	@RequestMapping("/edit/{contactId}")
	public String editContact(@PathVariable("contactId") Integer contactId, Model model){
		
		model.addAttribute("contactId", contactId);
		
		return "redirect:/edit";
	}
	
	@RequestMapping("/sortByNameDesc")
	public String sortByNameDescAndReturnContact(Model model){
		
		ApplicationService<Contact> appServ = new ApplicationServiceImpl();
		
		
		
		if(contactService.listContact().size()>0){
			
			List<Contact> contactList =appServ.sortByNameDesc(contactService.listContact());
			
			model.addAttribute("contactList", contactList);
			
			
			return "redirect:/sorted";
			
			
		}else{
			
			return "redirect:/index";
		}
		
		
	}
	
	@RequestMapping("/sortByNameAsc")
	public String sortByNameAscAndReturnContact(Model model){
		
		ApplicationService<Contact> appServ = new ApplicationServiceImpl();
		
		if(contactService.listContact().size()>0){
			
			List<Contact> contactList =appServ.sortByNameAsc(contactService.listContact());
			
			model.addAttribute("contactList", contactList);
			
			
			return "redirect:/sorted";
			
			
		}else{
			
			return "redirect:/index";
		}
	}
	
	@RequestMapping("/sorted")
	public String showSortedPage(@ModelAttribute("contactList") List<Contact> contactList,
			Map<String, Object> map,
			SessionStatus status){
		
		map.put("contact", new Contact());
		map.put("contactList", contactList);
		
		status.setComplete();
		
		return "contact1";
	}
	
	@RequestMapping("/found")
	public String showFoundValues(@ModelAttribute("foundContactList") List<Contact> contactList,
			Map<String, Object> map,
			SessionStatus status){
		
		map.put("contact", new Contact());
		map.put("contactList", contactService.listContact());
		map.put("foundContactList", contactList);
		
		status.setComplete();
		
		return "contact1";
	}
	
	@RequestMapping("/search")
	public String getSearchResult(
			@RequestParam("dataName") String dataName,
			Map<String, Object> map){
		
		List<Contact> contactList=null;
		
		contactList = contactService.getContactsByValue(dataName);
		
		if(contactList == null){
			
			Contact contact=new Contact();
			contact.setMessage("no data found");
			contactList=new ArrayList<Contact>();
			contactList.add(contact);
		}
		
		map.put("foundContactList", contactList);
		
		return "redirect:/found";
	}
	
	
}
