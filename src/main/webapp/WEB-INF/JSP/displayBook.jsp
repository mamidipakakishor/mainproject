<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Library Books – Dashboard</title>
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
    rel="stylesheet"/>
  <style>
    body {
      margin: 0;
      font-family: 'Inter', sans-serif;
      background: #f0f4ff;
      color: #222;
      padding: 20px;
    }
    .container {
      max-width: 1100px;
      margin: auto;
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.1em;
      margin-bottom: 20px;
    }
    .top-right-button {
      position: fixed;
      top: 20px;
      right: 20px;
      z-index: 999;
      display: flex;
      gap: 10px;
    }
    .top-right-button a,
    .add-button a {
      background: linear-gradient(90deg, #2563eb, #3b82f6);
      color: white;
      font-weight: 600;
      padding: 10px 25px;
      border-radius: 30px;
      text-decoration: none;
      box-shadow: 0 4px 12px rgba(37,99,235,0.5);
      transition: 0.3s ease;
      display: inline-block;
    }
    .top-right-button a:hover,
    .add-button a:hover {
      background: linear-gradient(90deg, #1d4ed8, #2563eb);
      box-shadow: 0 6px 18px rgba(29,78,216,0.7);
    }
    .search-filter input {
      width: 100%;
      max-width: 400px;
      margin: 0 auto 25px;
      display: block;
      padding: 12px 20px;
      border-radius: 30px;
      border: 2px solid #d1d5db;
      outline-color: #2563eb;
      font-size: 1rem;
    }
    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 12px;
      font-size: 1rem;
      min-width: 900px;
    }
    thead th {
      background: #2563eb;
      color: white;
      font-weight: 600;
      padding: 14px 12px;
      border-radius: 10px 10px 0 0;
    }
    tbody tr {
      background: #fff;
      box-shadow: 0 3px 12px rgba(0,0,0,0.05);
      border-radius: 10px;
      transition: background 0.2s;
    }
    tbody tr:hover {
      background: #dbe9ff;
    }
    tbody td {
      padding: 14px 10px;
      text-align: center;
      font-weight: 500;
    }
    .status {
      padding: 6px 14px;
      border-radius: 20px;
      font-weight: 600;
      font-size: 0.85rem;
      color: white;
      display: inline-block;
      min-width: 80px;
    }
    .status.available {
      background: linear-gradient(45deg, #16a34a, #22c55e);
    }
    .status.borrowed {
      background: linear-gradient(45deg, #dc2626, #ef4444);
    }
    .action-links {
      display: flex;
      justify-content: center;
      gap: 10px;
      flex-wrap: wrap;
    }
    .action-links a {
      color: white;
      font-weight: 600;
      padding: 8px 14px;
      border-radius: 22px;
      font-size: 0.9rem;
      text-decoration: none;
      transition: transform 0.2s;
    }
    .action-links a.edit { background: linear-gradient(45deg, #22c55e, #16a34a); }
    .action-links a.edit:hover { transform: scale(1.05); }
    .action-links a.delete { background: linear-gradient(45deg, #ef4444, #b91c1c); }
    .action-links a.delete:hover { transform: scale(1.05); }
    .action-links a.borrow { background: linear-gradient(45deg, #3b82f6, #2563eb); }
    .action-links a.borrow:hover { transform: scale(1.05); }
    .action-links a.return { background: linear-gradient(45deg, #f97316, #ea580c); }
    .action-links a.return:hover { transform: scale(1.05); }
    .add-button {
      text-align: center;
      margin-top: 30px;
    }
    .pagination {
      margin: 30px 0;
      display: flex;
      justify-content: center;
      gap: 12px;
    }
    .pagination button {
      background: #e0e7ff;
      border: none;
      padding: 10px 18px;
      border-radius: 8px;
      font-weight: 600;
      color: #2563eb;
      cursor: pointer;
      transition: background 0.3s;
    }
    .pagination button.active {
      background: #2563eb;
      color: white;
    }
    .pagination button:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
    @media (max-width: 900px) {
      table {
        min-width: 0;
        display: block;
        overflow-x: auto;
      }
      thead {
        display: none;
      }
      tbody tr {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px 20px;
        padding: 14px;
      }
      tbody td {
        text-align: left;
        padding: 0;
        border: none;
      }
      tbody td::before {
        content: attr(data-label);
        font-weight: 700;
        display: block;
        margin-bottom: 6px;
        color: #374151;
      }
      .top-right-button {
        position: static;
        text-align: center;
        margin-bottom: 25px;
      }
    }
  </style>
</head>
<body>

  <div class="top-right-button">
    <a href="/library/home">Back to Home</a>
    <a href="/logout">Logout</a>
  </div>

  <div class="container">
    <h2>Library Book List</h2>

    <div class="search-filter">
      <input
        type="text"
        placeholder="Search by Name, Author, Status..."
        onkeyup="filterBooks(this.value)"
      />
    </div>

    <table aria-label="Library book list">
      <thead>
        <tr>
          <th>Sr. No.</th>
          <th>Name</th>
          <th>Author</th>
          <th>Price</th>
          <th>Status</th>
          <th>Borrowed Date</th>
          <th>Borrowed For (Days)</th>
          <th>Due Date</th>
          <th>Actions</th>
          
          
          <th>Borrowed By</th>
          
        </tr>
      </thead>
      <tbody id="book-table-body">
        <c:forEach var="book" items="${books}" varStatus="loop">
          <tr class="visible">
            <td data-label="Sr. No.">${loop.index + 1}</td>
            <td data-label="Name">${book.name}</td>
            <td data-label="Author">${book.author}</td>
            <td data-label="Price">${book.price}</td>
            <td data-label="Status">
              <span class="status ${book.status == 'Available' ? 'available' : 'borrowed'}">
                ${book.status}
              </span>
            </td>
            <td data-label="Borrowed Date">
              <c:out value="${book.borrowedDate}" default="-" />
            </td>
            <td data-label="Borrowed For (Days)">
              <c:choose>
                <c:when test="${book.borrowedForDays > 0}">
                  ${book.borrowedForDays}
                </c:when>
                <c:otherwise>Not Borrowed</c:otherwise>
              </c:choose>
            </td>
            <td data-label="Due Date">
              <c:if test="${book.borrowedDate != null && book.borrowedForDays > 0}">
                ${book.borrowedDate.plusDays(book.borrowedForDays)}
              </c:if>
              <c:if test="${book.borrowedDate == null || book.borrowedForDays == 0}">
                -
              </c:if>
            </td>
            
            
            
            
            <td data-label="Borrowed By">
  <c:choose>
    <c:when test="${book.borrowedBy != null}">
      ${book.borrowedBy.username}
    </c:when>
    <c:otherwise>-</c:otherwise>
  </c:choose>
</td>
            
            
            
            
            <td data-label="Actions" class="action-links">
              <!-- EDIT & DELETE only for ADMIN -->
              <c:if test="${sessionScope.loggedInUser.role == 'ADMIN'}">
                <a href="/library/editBook/${book.id}" class="edit" title="Edit Book">
                  Edit
                </a>
                <a href="/library/deleteBook/${book.id}"
                   class="delete"
                   onclick="return confirm('Are you sure you want to delete this book?');"
                   title="Delete Book">
                  Delete
                </a>
              </c:if>

              <!-- BORROW/RETURN available to all -->
              <c:if test="${book.status == 'Available'}">
                <a href="/library/borrowBookForm/${book.id}" class="borrow" title="Borrow Book">
                  Borrow
                </a>
              </c:if>
              <c:if test="${book.status == 'Borrowed'}">
                <a href="/library/returnBook/${book.id}" class="return" title="Return Book">
                  Return
                </a>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div class="pagination" id="pagination-controls"></div>

    <div class="add-button">
      <a href="/library/addBookForm">+ Add New Book</a>
    </div>
  </div>

  <script>
    const rowsPerPage = 5;
    let currentPage = 1;  
    function filterBooks(query) {
      query = query.toLowerCase();
      const rows = document.querySelectorAll('#book-table-body tr');
      rows.forEach(row => {
        row.classList.toggle('visible', row.textContent.toLowerCase().includes(query));
      });
      currentPage = 1;
      paginateTable();
    }
    function paginateTable() {
      const rows = [...document.querySelectorAll('#book-table-body tr')];
      const visibleRows = rows.filter(r => r.classList.contains('visible'));
      const totalPages = Math.ceil(visibleRows.length / rowsPerPage);
      const start = (currentPage - 1) * rowsPerPage;
      const end = start + rowsPerPage;
      rows.forEach(r => r.style.display = 'none');
      visibleRows.slice(start, end).forEach(r => r.style.display = '');
      const container = document.getElementById('pagination-controls');
      container.innerHTML = '';
      const makeBtn = (text, disabled, active, onClick) => {
        const btn = document.createElement('button');
        btn.textContent = text;
        if (disabled) btn.disabled = true;
        if (active) btn.classList.add('active');
        btn.onclick = onClick;
        return btn;
      };
      container.appendChild(makeBtn('Prev', currentPage === 1, false, () => {
        currentPage--; paginateTable();
      }));
      for (let i = 1; i <= totalPages; i++) {
        container.appendChild(makeBtn(i, false, i === currentPage, () => {
          currentPage = i; paginateTable();
        }));
      }
      container.appendChild(makeBtn('Next', currentPage === totalPages || totalPages === 0, false, () => {
        currentPage++; paginateTable();
      }));
    }
    window.addEventListener('load', () => {
      document.querySelectorAll('#book-table-body tr').forEach(r => r.classList.add('visible'));
      paginateTable();
    });
  </script>
</body>
</html>