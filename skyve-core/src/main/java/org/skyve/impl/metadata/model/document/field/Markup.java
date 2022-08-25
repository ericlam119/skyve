package org.skyve.impl.metadata.model.document.field;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;

@XmlType(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
@XmlRootElement(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
public class Markup extends Memo {
	private static final long serialVersionUID = -4849631120596097936L;

	public Markup() {
		setAttributeType(AttributeType.markup);
	}
}
