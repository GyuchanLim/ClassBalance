document.addEventListener('DOMContentLoaded', function () {
  const addClientButton = document.getElementById('add_client_button');
  const clientFieldsContainer = document.getElementById('client_fields');
  const clientTemplate = document.getElementById('client_template');
  let clientCount = 0; // Starting client count (we already have client_1)

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

    // Add remove button functionality
    const removeButton = newClientField.querySelector('.remove-client-btn');
    removeButton.addEventListener('click', function() {
      newClientField.remove();
      clientCount--; // Decrease client counter when a field is removed
    });

    // Append the new client field to the container
    clientFieldsContainer.appendChild(newClientField);
  });
});