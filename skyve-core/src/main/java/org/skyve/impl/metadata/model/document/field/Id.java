package org.skyve.impl.metadata.model.document.field;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;
import org.skyve.metadata.model.document.DomainType;

@XmlType(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
@XmlRootElement(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
public class Id extends Field {
	private static final long serialVersionUID = -4193089805642262555L;

	public Id() {
		setAttributeType(AttributeType.id);
	}
	
	/**
	 * Not used
	 */
	@Override
	@XmlTransient
	public DomainType getDomainType() {
		return null;
	}
}
