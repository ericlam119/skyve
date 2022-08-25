package org.skyve.impl.metadata.view;

import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;

@XmlType(namespace = XMLMetaData.VIEW_NAMESPACE)
public enum ShrinkWrap {
	width, height, both
}
