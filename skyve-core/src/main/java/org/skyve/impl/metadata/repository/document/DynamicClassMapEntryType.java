package org.skyve.impl.metadata.repository.document;

import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;
import org.skyve.metadata.SerializableMetaData;

/**
 * Represents a key/value map entry in JAXB.
 */
@XmlType(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
public final class DynamicClassMapEntryType implements SerializableMetaData {
	private static final long serialVersionUID = 3673208891368676455L;

	@XmlAttribute(required = true)
	String name;
	
	@XmlAttribute(required = true)
	String className;
}
