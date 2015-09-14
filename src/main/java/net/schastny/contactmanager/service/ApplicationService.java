package net.schastny.contactmanager.service;

import java.util.List;

import net.schastny.contactmanager.domain.Contact;

public interface ApplicationService<T> {

	public List<T> sortByNameDesc(List<T> t);
	public List<T> sortByNameAsc(List<T> t);
}
