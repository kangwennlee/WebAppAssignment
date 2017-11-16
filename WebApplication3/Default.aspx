<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Banner -->
    <section id="banner">
        <div class="content">
            <header>
                <h2>The Art and Soul of Southeast Asia</h2>
                <p>
                    Discover the world's largest collection of<br />
                    modern Southeast Asian art within one of<br />
                    Singapore's most significant buildings
                </p>
            </header>
            <span class="image">
                <img src="images/national-gallery-singapore.jpg" alt="" /></span>
        </div>
        <a href="#one" class="goto-next scrolly">Next</a>
    </section>

    <!-- One -->
    <section id="one" class="spotlight style1 bottom">
        <span class="image fit main">
            <img src="images/building2.jpg" alt="" /></span>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="4u 12u$(medium)">
                        <header>
                            <h2>About this Gallery</h2>
                            <p></p>
                        </header>
                    </div>
                    <div class="4u 12u$(medium)">
                        <p>
                            National Gallery Singapore is a visual arts institution which oversees the largest public collection of modern art in Singapore and Southeast Asia. Situated in the heart of the Civic District, the Gallery is housed in two national monuments—City Hall and former Supreme Court—that have been beautifully restored and transformed into this exciting venue.
                        </p>
                    </div>
                    <div class="4u$ 12u$(medium)">
                        <p>
                            Reflecting Singapore’s unique heritage and geographical location, the Gallery features Singapore and Southeast Asian art from Singapore’s National Collection in its long-term and special exhibitions. The Gallery also works with international museums to jointly present Southeast Asian art in the global context, positioning Singapore as a regional and international hub for the visual arts.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <a href="#two" class="goto-next scrolly">Next</a>
    </section>

    <!-- Two -->
    <section id="two" class="spotlight style2 right">
        <span class="image fit main">
            <img src="images/building3.jpg" alt="" /></span>
        <div class="content">
            <header>
                <h2>Interdum amet non magna accumsan</h2>
                <p>Nunc commodo accumsan eget id nisi eu col volutpat magna</p>
            </header>
            <p>Feugiat accumsan lorem eu ac lorem amet ac arcu phasellus tortor enim mi mi nisi praesent adipiscing. Integer mi sed nascetur cep aliquet augue varius tempus lobortis porttitor lorem et accumsan consequat adipiscing lorem.</p>
            <ul class="actions">
                <li><a href="#" class="button">Learn More</a></li>
            </ul>
        </div>
        <a href="#three" class="goto-next scrolly">Next</a>
    </section>

    <!-- Three -->
    <section id="three" class="spotlight style3 left">
        <span class="image fit main bottom">
            <img src="images/techstudio_exhibitions_declarations_dreams_2085x1300_20171010204934_1080p.jpg" alt="" /></span>
        <div class="content">
            <header>
                <h2>Between Declarations and Dreams: Art of Southeast Asia since the 19th Century</h2>
                <p>Programme Details: Ongoing All Day</p>
            </header>
            <p>Starting in the 19th century, the history of Southeast Asian art is characterised by a continuous encounter with the new, inseparably linked to the region’s tumultuous social and political history. The meaning and expression of art was constantly negotiated as artists of Southeast Asia sought to incorporate and reinvent local expressions and aesthetic traditions as they grappled with modernity.
</p>
            <ul class="actions">
                <li><a href="#" class="button">Learn More</a></li>
            </ul>
        </div>
        <a href="#four" class="goto-next scrolly">Next</a>
    </section>

    <!-- Four -->
    <section id="four" class="wrapper style1 special fade-up">
        <div class="container">
            <header class="major">
                <h2>Your Experience At The Gallery</h2>
                <p>Gallery Etiquette</p>
            </header>
            <div class="box alt">
                <div class="row uniform">
                    <section class="4u 6u(medium) 12u$(xsmall)">
                        <span class="icon alt major fa-image"></span>
                        <h3>Touching the Artwork</h3>
                        <p>Please do not touch the artworks. Even clean hands can cause damage.</p>
                    </section>
                    <section class="4u 6u$(medium) 12u$(xsmall)">
                        <span class="icon alt major fa-cutlery"></span>
                        <h3>Food & Beverage</h3>
                        <p>Food and drink (including bottled water) are not permitted in the galleries.</p>
                        <p>Food and drink should be consumed at the Gallery's restaurants and bars only.</p>
                    </section>
                    <section class="4u$ 6u(medium) 12u$(xsmall)">
                        <span class="icon alt major fa-female"></span>
                        <h3>Dress Code</h3>
                        <p>There is no dress code for the Gallery.</p>
                        <p>However do note that our exhibition spaces are climate controlled to conserve our artworks so it is advisable to bring something to keep yourself warm.</p>
                    </section>
                    <section class="4u 6u$(medium) 12u$(xsmall)">
                        <span class="icon alt major fa-hand-paper-o"></span>
                        <h3>Security</h3>
                        <p>Bags may be subjected to inspection for security reasons.</p>
                        <p>To help protect the artworks, please store bulky items and large bags in the lockers provided at B1.</p>
                    </section>
                    <section class="4u 6u(medium) 12u$(xsmall)">
                        <span class="icon alt major fa-wheelchair"></span>
                        <h3>Accessibility</h3>
                        <p>All galleries and facilities are wheelchair accessible.</p>
                        <p>Standard-size motorised wheelchairs are permitted in the galleries.</p>
                    </section>
                    <section class="4u$ 6u$(medium) 12u$(xsmall)">
                        <span class="icon alt major fa-camera-retro"></span>
                        <h3>Photography</h3>
                        <p>No flash photography or videography is permitted in the galleries. Use of selfie sticks and tripods is also not permitted in the galleries.</p>
                    </section>
                </div>
            </div>
            <footer class="major">
                <ul class="actions">
                    <li><a href="#" class="button">Learn More</a></li>
                </ul>
            </footer>
        </div>
    </section>

    <!-- Five -->
    <section id="five" class="wrapper style2 special fade">
        <div class="container">
            <header>
                <h2>Subscribe Newsletter</h2>
                <p>Keep up with all the latest news, events, and promotions at the Gallery. Sign up for our e-newsletter today!</p>
            </header>
            <form method="post" action="#" class="container 50%">
                <div class="row uniform 50%">
                    <div class="8u 12u$(xsmall)">
                        <input type="email" name="email" id="email" placeholder="Your Email Address" />
                    </div>
                    <div class="4u$ 12u$(xsmall)">
                        <input type="submit" value="Get Started" class="fit special" />
                    </div>
                </div>
            </form>
        </div>
    </section>
</asp:Content>

