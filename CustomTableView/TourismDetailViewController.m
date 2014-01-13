//
//  TourismDetailViewController.m
//  CustomTableView


#import "TourismDetailViewController.h"

#define METERS_PER_MILE 1609.344
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface TourismDetailViewController ()

@end

@implementation TourismDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *title = nil;
    NSString *description = nil;
    NSString *price = nil;
    NSString *website = nil;
    NSString *image = nil;
    NSString *address = nil;
    
    switch (self.row) {
        case 0:
            image = @"tourism1.jpg";
            title = @"La tour Eiffel et le Trocadero";
            description = @"La Tour Eiffel named after the engineer Gustave Eiffel, whose company designed and built the tower. Erected in 1889, it has become both a global cultural icon of France and one of the most recognizable structures in the world. The tower is the most-visited paid monument in the world.";
            price = @"Stairs Tickets:€8,50/€5,00";
            website = @"http://www.tour-eiffel.fr";
            address = @"Trocadéro 75116 Paris";
            break;
        case 1:
            image = @"tourism2.jpg";
            title = @"Le Louvre";
            description = @"The Louvre or Louvre Museum is one of the world's largest museums and a historic monument. A central landmark of Paris, France, it is located on the Right Bank of the Seine in the 1st arrondissement.";
            price = @"Entry 8.50€. Entry free with /r a valid EU Student Card)";
            website = @"www.louvre.fr";
            address = @"75001 Paris";
            break;
        case 2:
            image = @"tourism3.jpg";
            title = @"Cathédrale Note Dame de Paris";
            description = @"Notre-Dame de Paris, also known as Notre-Dame Cathedral or simply Notre-Dame, is an historic Catholic cathedral on the eastern half of the Île de la Cité in the fourth arrondissement of Paris, France.";
            price = @"Free";
            website = @"www.notredamedeparis.fr";
            address = @"6 Parvis Notre-Dame/r, 75004 Paris";
          
            break;
        case 3:
            image = @"tourism4.jpg";
            title = @"Musée d'Orsay";
            description = @"The Musée d'Orsay  is a museum in Paris, France, on the left bank of the Seine. The museum holds mainly French art dating from 1848 to 1915, including paintings, sculptures, furniture, and photography. It houses the largest collection of impressionist and post-impressionist masterpieces in the world, by painters including Monet, Manet, Degas, Renoir, Cézanne, Seurat, Sisley,Gauguin and Van Gogh";
            price = @"Free for citizens or long-term /r residents of any EU country";
            website = @"www.musee-orsay.fr";
            address = @"1 Rue de la Légion d'Honneur,/r 75007 Paris";
            break;
        case 4:
            image = @"tourism5.jpg";
            title = @"La Sorbonee et le quartier Latin";
            description = @"The Latin Quarter is located on the left bank of the Seine in Paris in the 5 th district and in the north and east of the 6 th arrondissement , with the historic heart Sorbonne . It takes its name from the exclusive use of Latin in the courses offered by schools and universities medieval installed in the area.";
            price = @"Free";
            website = @"http://en.wikipedia.org/wiki/Latin_Quarter,_Paris";
            address = @"5th & 6th Arrondissement";
            break;
        case 5:
            image = @"tourism6.jpg";
            title = @"L'Arc de Triomphe et les Champs-Elysees";
            description = @"The Avenue des Champs-Élysées is a street in Paris, France. With its cinemas, cafés, luxury specialty shops and clipped horse-chestnut trees, the Champs-Élysées is arguably one of the world's most famous street.";
            price = @"Free";
            website = @"http://en.wikipedia.org/wiki/Champs-Élysées";
            address = @"Place Charles de Gaulle, 75008 Paris ";
            break;
        case 6:
            image = @"tourism7.jpg";
            title = @"Le Chateau de Versailes";
            description = @"The Palace of Versailles, or simply Versailles, is a royal château in Versailles in the Île-de-France area of France. In French it is the Château de Versailles";
            price = @"Passport ticket: 18€ /r Palace Ticket: 15€";
            website = @"www.chateauversailles.fr";
            address = @"Place d'Armes, 78000 Versailles";
            break;
        case 7:
            image = @"tourism8.jpg";
            title = @"Chateau de Fountainebleau";
            description = @"The Palace of Fontainebleau, located 55 km from the center of Paris, is one of the large largest French royal châteaux. The palace as it is today is the work of many French monarchs, building on an early 16th-century structure of France.";
            price = @"Full price: 11€. /r Reduced price  : 9€.";
            website = @"www.musee-chateau-fontainebleau.fr";
            address = @"77300 Fontainebleau";
            break;
        case 8:
            image = @"tourism9.jpg";
            title = @"Disneyland";
            description = @"Disneyland Paris, originally Euro Disney Resort, is an entertainment resort in Marne-la-Vallée, a new town located 32 km east of the center of Paris and is the most visited attraction in all of France and Europe.";
            price = @"Between 40 to 55€.";
            website = @"www.disneylandparis.fr‎";
            address = @"77777 Marne La Vallée ";
            break;
        case 9:
            image = @"tourism10.jpg";
            title = @"Père Lachaise Cemetery";
            description = @"Père Lachaise Cemetery is the large largest cemetery in the city of Paris, though there are larger cemeteries in the city's suburbs and has Burials of Jim Morrison, Oscar Wilde, Edith Piaf, Chopin";
            price = @"Free";
            website = @"www.pere-lachaise.com";
            address = @"16 Rue du Repos, 75020 Paris";
            break;
    }
    self.imageView.image = [UIImage imageNamed:image];
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    self.descriptionLabel.text = description;
    [self.descriptionLabel sizeToFit];
    self.priceLabel.text = price;
    [self.priceLabel sizeToFit];
    self.addressLabel.text = address;
    [self.addressLabel sizeToFit];
    self.websiteLabel.text = website;
    [self.websiteLabel sizeToFit];
    
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
    
    [self.prLabel setFrame:CGRectMake(self.prLabel.frame.origin.x, self.descriptionLabel.frame.origin.y + self.descriptionLabel.frame.size.height + 15, self.prLabel.frame.size.width, self.prLabel.frame.size.height)];
    [self.priceLabel setFrame:CGRectMake(self.priceLabel.frame.origin.x, self.prLabel.frame.origin.y + self.prLabel.frame.size.height + 15, self.priceLabel.frame.size.width, self.priceLabel.frame.size.height)];
    
    [self.addrLabel setFrame:CGRectMake(self.prLabel.frame.origin.x, self.priceLabel.frame.origin.y + self.priceLabel.frame.size.height + 15, self.prLabel.frame.size.width, self.prLabel.frame.size.height)];
    
    
    [self.addressLabel setFrame:CGRectMake(self.addressLabel.frame.origin.x, self.addrLabel.frame.origin.y + self.addrLabel.frame.size.height + 15, self.addressLabel.frame.size.width, self.addressLabel.frame.size.height)];
    
    [self.mapView setFrame:CGRectMake(self.mapView.frame.origin.x, self.addressLabel.frame.origin.y + self.addressLabel.frame.size.height + 15, self.mapView.frame.size.width, self.mapView.frame.size.height)];
    
    [self.webLabel setFrame:CGRectMake(self.webLabel.frame.origin.x, self.mapView.frame.origin.y + self.mapView.frame.size.height + 15, self.webLabel.frame.size.width, self.webLabel.frame.size.height)];
    [self.websiteLabel setFrame:CGRectMake(self.websiteLabel.frame.origin.x, self.webLabel.frame.origin.y + self.webLabel.frame.size.height + 15, self.websiteLabel.frame.size.width, self.websiteLabel.frame.size.height)];
    
    CGFloat height = 0.0f;
    for (UIView *v in self.contentScrollView.subviews)
    {
        height = height + v.frame.size.height;
    }
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.contentSize.width, height + 50 + 6*15);
    
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.contentSize.width, height + 50 + 6*15);
    if (IS_OS_7_OR_LATER)
    {
        CGRect frame = self.contentScrollView.frame;
        frame.origin.y -= 65;
        self.contentScrollView.frame = frame;
    }
    
    
    /*
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         
                         MKCoordinateRegion region = self.mapView.region;
                         region.center = placemark.region.center;
                         region.span.longitudeDelta /= 2500.0;
                         region.span.latitudeDelta /= 2500.0;
                         
                         [self.mapView setRegion:region animated:NO];
                         [self.mapView addAnnotation:placemark];
                     }
                 }
     ];
     */
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
