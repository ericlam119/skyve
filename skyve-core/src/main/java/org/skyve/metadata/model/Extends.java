package org.skyve.metadata.model;

import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.UtilImpl;
import org.skyve.impl.util.XMLMetaData;

@XmlRootElement(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
@XmlType(namespace = XMLMetaData.DOCUMENT_NAMESPACE)
public class Extends {
	private String documentName;
 	public String getDocumentName() {
        return documentName;
    }

    @XmlAttribute(name="document", required = true)
    public void setDocumentName(String documentName) {
        this.documentName = UtilImpl.processStringValue(documentName);
    }
}
