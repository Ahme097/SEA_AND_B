Yacht Rental Website

This is a web application for a yacht rental service. Users can browse and search for yachts available for rent, make reservations, and leave ratings for their experiences. Owners can list their yachts, set their availability and prices, and accept booking requests.

This project was created using the Le Wagon Rails template provided by Le Wagon coding bootcamp.

User Stories:
Visitors;
View all available yachts on the home page.
Search for yachts based on specific locations.
Browse offers to find the best price.
Make reservations for a chosen yacht.
Rate yachts after usage to share their experience.
Owners;
Advertise yachts for rent with pictures and details.
List the availability and prices of yachts.
Accept offers from users to confirm yacht rentals.
Rate users after they return the yacht.
Routes

Pages Controller:
GET /: Renders the home page.
Yachts Controller
GET /yachts: Renders the index page with a list of available yachts.
GET /yachts/:id: Renders the show page for a specific yacht.
GET /yachts/new: Renders the new yacht form.
POST /yachts: Creates a new yacht.
GET /yachts/:id/edit: Renders the edit form for a specific yacht.
PATCH /yachts/:id: Updates a specific yacht.
DELETE /yachts/:id: Deletes a specific yacht.
Offers Controller
GET /offers: Renders the index page with a list of available offers.
Bookings Controller
GET /bookings: Renders the index page with a list of user bookings.
POST /bookings: Creates a new booking.
UserRatings Controller
POST /user_ratings: Creates a new rating and comment for a booking.
YachtRatings Controller
POST /yacht_ratings: Creates a new rating and comment for a booking.

Technologies Used:
Ruby on Rails
PostgreSQL (Database)
HTML, CSS, JavaScript (Frontend)
Bootstrap (Frontend Framework)
Devise (Authentication)
Simple Form (Form Handling)

If you encounter any issues or have questions about the project, feel free to contact us or open an issue in this repository.

Acknowledgments:

This project was developed using the resources and guidance provided by the Le Wagon coding bootcamp. We acknowledge their contribution to coding education.
