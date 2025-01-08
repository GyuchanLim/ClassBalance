document.addEventListener('DOMContentLoaded', function () {
  const addClientButton = document.getElementById('add_client_button');
  const clientFieldsContainer = document.getElementById('client_fields');
  const clientTemplate = document.getElementById('client_template');
  let clientCount = document.querySelectorAll('[id^="client_"]').length; // Count existing client fields
  const removeButtons = document.querySelectorAll('.remove-client-btn'); // To handle removing existing client fields

  // Function to handle removing the client field
  function removeClientField(event) {
    const clientRow = event.target.closest('.client-row'); // Find the closest client-row
    if (clientRow) {
      clientRow.remove();
      clientCount--; // Decrease the client count
    }
  }

  // Add event listeners to already existing "Remove" buttons
  removeButtons.forEach(button => {
    button.addEventListener('click', removeClientField);
  });

  // Add client event
  addClientButton.addEventListener('click', function(event) {
    event.preventDefault(); // Prevent the link from navigating

    clientCount++; // Increment client counter

    // Clone the client template
    const newClientField = clientTemplate.cloneNode(true);
    
    // Modify the ID and name attributes to reflect the new client (client_2, client_3, etc.)
    const newSelect = newClientField.querySelector('select');
    newSelect.name = `appointment[client_${clientCount}]`;
    newSelect.id = `appointment_client_${clientCount}`;

    // Make the new client field visible by setting display to block
    newClientField.style.display = 'block';

    // Add remove button functionality for the new client
    const removeButton = newClientField.querySelector('.remove-client-btn');
    removeButton.addEventListener('click', removeClientField);

    // Append the new client field to the container
    clientFieldsContainer.appendChild(newClientField);
  });
});
