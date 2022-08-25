package org.skyve.impl.metadata.model.document.field;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;

@XmlType(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
@XmlRootElement(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
public class Boolean extends ConvertableField {
	private static final long serialVersionUID = 4887475952064140008L;

	public Boolean() {
		setAttributeType(AttributeType.bool);
	}
}
