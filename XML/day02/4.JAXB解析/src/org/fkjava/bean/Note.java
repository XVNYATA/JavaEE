package org.fkjava.bean;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
<note>
  <to>马航</to>
  <from>失联</from>
  <heading>飞机去哪儿了</heading>
  <body>你快回来</body>
</note>
 * */

@XmlRootElement(name="note")
public class Note {

	private To to;
	private String from;
	private String heading;
	private String body;

	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}

	public To getTo() {
		return to;
	}

	@XmlElement(name="to")
	public void setTo(To to) {
		this.to = to;
	}

	public String getFrom() {
		return from;
	}

	@XmlElement(name="from")
	public void setFrom(String from) {
		this.from = from;
	}

	public String getHeading() {
		return heading;
	}
	
	@XmlElement(name="heading")
	public void setHeading(String heading) {
		this.heading = heading;
	}

	public String getBody() {
		return body;
	}

	@XmlElement(name="body")
	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "Note [to=" + to + ", from=" + from + ", heading=" + heading
				+ ", body=" + body + "]";
	}


}
