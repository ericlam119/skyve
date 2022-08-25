package org.skyve.impl.metadata.model.document.field;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;

@XmlType(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
@XmlRootElement(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
public class Colour extends ConvertableField {
	private static final long serialVersionUID = 2815253897974678949L;

	public Colour() {
		setAttributeType(AttributeType.colour);
	}
}
