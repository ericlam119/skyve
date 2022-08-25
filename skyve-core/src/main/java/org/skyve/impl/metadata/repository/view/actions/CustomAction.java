package org.skyve.impl.metadata.repository.view.actions;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;

@XmlType(namespace = XMLMetaData.VIEW_NAMESPACE)
@XmlRootElement(namespace = XMLMetaData.VIEW_NAMESPACE, name = "action")
public class CustomAction extends ClassAction {
	private static final long serialVersionUID = 2552404774127789764L;

	// nothing to see here
}
