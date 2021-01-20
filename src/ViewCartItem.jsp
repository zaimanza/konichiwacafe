<%-- TAK CHECK LAGI --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>

<%
    List<int> arrayItemID = (List<int>) session.getAttribute("arrayItemID");
    List<int> arrayItemQty = (List<int>) session.getAttribute("arrayItemQty");
    List<CartItem> cartItems = new ArrayList<CartItem>();
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","konichiwa","cafe");
        Statement stmt = conn.createStatement();
        for (int counter = 0; counter < arrayItemID.size(); counter++) { 		
            String sql="SELECT * FROM item WHERE itemID = " + arrayItemID.get(counter) +"";
		    ResultSet rs = stmt.executeQuery(sql);
            CartItem cartItem = new CartItem();

            cartItem.setCartId(rs.getString("itemID"));
            cartItem.setItemName(rs.getString("itemName"));
            cartItem.setItemPrice(rs.getString("itemPrice"));
            cartItem.setItemStock(rs.getString("itemStock"));
            cartItem.setItemDesc(rs.getString("itemDesc"));
            cartItem.setStaffId(rs.getString("staffID"));
            String sqlCategory="SELECT * FROM item_category WHERE itemCategoryID = " + rs.getString("itemCategoryID") +"";
            ResultSet rsCategory = stmt.executeQuery(sqlCategory);
            cartItem.setCategoryName(rsCategory.getString("CategoryName"));

            cartItems.add(cartItem);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
		
    }
%>


<html>
   <head>
      <title>CART</title>
   </head>

   <body>
         <h2>CART</h2>

            <table>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Description</th>
                    <th>Category</th>
                </tr>
            </table>

<%-- create empty object --%>
            <% for(int i=0 ; i < cartItems.size() ; i++) { %>
                <tr>
                    <td><% cartItems.get(i).itemID %></td>
                    <td><% cartItems.get(i).itemName %></td>
                    <td><% cartItems.get(i).itemPrice %></td>
                    <td><% cartItems.get(i).itemStock %></td>
                    <td><% cartItems.get(i).itemDesc %></td>
                    <td><% cartItems.get(i).CategoryName %></td>
                </tr>
            <% } %>
   
   </body>
</html>