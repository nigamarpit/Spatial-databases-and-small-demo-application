package demo;
import java.sql.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.geom.Point2D;

import javax.swing.JCheckBox;
import javax.swing.JFrame;
import oracle.spatial.geometry.JGeometry;
import oracle.sql.STRUCT;

public class Demo extends JFrame implements ActionListener, MouseListener, Runnable{
	private static final long serialVersionUID = 1L;
	int chkstatus=0;
	int mx;
	int my;
	public static void main(String[] args){
		new Demo().setVisible(true);
	}
	
	private Demo()
	{		
		super("CSCI 585 (FALL 2015) HW5 Demo - ARPIT NIGAM");
		addMouseListener(this);
		setSize(510,550);
		setResizable(false);
		setLayout(new BorderLayout());
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		JCheckBox chk = new JCheckBox("show lions and ponds in selected region");
		add(chk,BorderLayout.SOUTH);
		chk.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {            	
            	if(chk.isSelected())
            	{
            		chkstatus=1;
            	}
            	else
            	{
            		chkstatus=0;
                	repaint();
            	}
            }
        });
	}
	
	public void paint (Graphics g) {
		if((chkstatus==0))
		{
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","SYSTEM","computer123");
		Statement st=con.createStatement();
		STRUCT str=null;		
		
		String sql1="select * from T_LION";
		ResultSet rs=st.executeQuery(sql1);

		while(rs.next())
		{
			str= (oracle.sql.STRUCT) rs.getObject(2);
			JGeometry j_geom = JGeometry.load(str);  
			Graphics2D g2d = (Graphics2D)g;
			g2d.setColor(Color.green);
			g2d.drawRect((int)j_geom.getPoint()[0],(int)j_geom.getPoint()[1], 1, 1);
			//			System.out.println((int)j_geom.getPoint()[0]+"-"+(int)j_geom.getPoint()[1]);
		}
		
		String sql2="select * from T_REGION";
		ResultSet rs2=st.executeQuery(sql2);
		while(rs2.next())
		{
			str= (oracle.sql.STRUCT) rs2.getObject(2);
			JGeometry j_geom = JGeometry.load(str);
			Graphics2D g2d = (Graphics2D)g;
			g2d.setColor(Color.black);
			Polygon p=new Polygon();
			p.addPoint((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1]);
			p.addPoint((int)j_geom.getOrdinatesArray()[2],(int)j_geom.getOrdinatesArray()[3]);
			p.addPoint((int)j_geom.getOrdinatesArray()[4],(int)j_geom.getOrdinatesArray()[5]);
			p.addPoint((int)j_geom.getOrdinatesArray()[6],(int)j_geom.getOrdinatesArray()[7]);
			g2d.drawPolygon(p);
		}
		
		String sql3="select * from T_POND";
		ResultSet rs3=st.executeQuery(sql3);
		while(rs3.next())
		{			
			str= (oracle.sql.STRUCT) rs3.getObject(2);
			JGeometry j_geom = JGeometry.load(str);
			Graphics2D g2d = (Graphics2D)g;
			g2d.setColor(Color.black);
			g2d.drawArc((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1],15,15,0,360);
			g2d.setColor(Color.blue);
			g2d.fillArc((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1],15,15,0,360);
		}
		con.close();
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
		
		// ***CheckBox Selected and Mouse Click event***
		else
		{
		//System.out.println(mx+"-"+my);
		Point2D.Double m_coor = new Point2D.Double(mx, my);
		
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","SYSTEM","computer123");
		Statement st=con.createStatement();
		STRUCT str=null;
		
		String sql2="select * from T_REGION";
		ResultSet rs2=st.executeQuery(sql2);
		Polygon des_reg=new Polygon();
		while(rs2.next())
		{
			str= (oracle.sql.STRUCT) rs2.getObject(2);
			JGeometry j_geom = JGeometry.load(str);
			Graphics2D g2d = (Graphics2D)g;
			g2d.setColor(Color.black);
			Polygon p=new Polygon();
			p.addPoint((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1]);
			p.addPoint((int)j_geom.getOrdinatesArray()[2],(int)j_geom.getOrdinatesArray()[3]);
			p.addPoint((int)j_geom.getOrdinatesArray()[4],(int)j_geom.getOrdinatesArray()[5]);
			p.addPoint((int)j_geom.getOrdinatesArray()[6],(int)j_geom.getOrdinatesArray()[7]);
			g2d.drawPolygon(p);
			
			if(p.contains(m_coor)){
				des_reg=p;
			}			
		}	
		
		String sql1="select * from T_LION";
		ResultSet rs=st.executeQuery(sql1);

		while(rs.next())
		{
			str= (oracle.sql.STRUCT) rs.getObject(2);
			JGeometry j_geom = JGeometry.load(str);  
			Graphics2D g2d = (Graphics2D)g;
			if(des_reg.contains((int)j_geom.getPoint()[0],(int)j_geom.getPoint()[1])){
				g2d.setColor(Color.red);
				g2d.drawRect((int)j_geom.getPoint()[0],(int)j_geom.getPoint()[1], 1, 1);
			}
			else
			{
				g2d.setColor(Color.green);
				g2d.drawRect((int)j_geom.getPoint()[0],(int)j_geom.getPoint()[1], 1, 1);
			}
		}
		
		String sql3="select * from T_POND";
		ResultSet rs3=st.executeQuery(sql3);
		while(rs3.next())
		{			
			str= (oracle.sql.STRUCT) rs3.getObject(2);
			JGeometry j_geom = JGeometry.load(str);
			Graphics2D g2d = (Graphics2D)g;
			g2d.setColor(Color.black);
			g2d.drawArc((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1],15,15,0,360);
			if(des_reg.contains((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1])){
				g2d.setColor(Color.red);
				g2d.fillArc((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1],15,15,0,360);
			}
			else
			{
				g2d.setColor(Color.blue);
				g2d.fillArc((int)j_geom.getOrdinatesArray()[0],(int)j_geom.getOrdinatesArray()[1],15,15,0,360);
			}
		}		
		con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		//System.out.println();
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		if(chkstatus==1)
		{
		//System.out.println(e.getX());
		//System.out.println(e.getY());
		mx=e.getX();
		my=e.getY();
		repaint();
		}		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void run() {
	}
}
