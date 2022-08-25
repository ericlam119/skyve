package org.skyve.impl.metadata.model.document.field;

import jakarta.xml.bind.annotation.XmlTransient;

import org.skyve.metadata.model.Attribute;

@XmlTransient
public interface LengthField extends Attribute {
	public int getLength();
	public void setLength(int length);
}
