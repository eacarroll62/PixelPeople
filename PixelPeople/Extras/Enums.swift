//
//  Enums.swift
//  PixelPeople
//
//  Created by Eric Carroll on 5/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

enum SeasonFilter: String, Equatable, CaseIterable {
    case harvest = "Harvest"
    case thaw = "Thaw"
    case swell = "Swell"
    case frost = "Frost"
    case any = "Any"
    case altar = "Altar"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum CategoryFilter: String, Equatable, CaseIterable {
    case aquatic = "Aquatic"
    case arboreal = "Arboreal"
    case bear = "Bear"
    case bigCat = "Big Cat"
    case bird = "Bird"
    case carnivore = "Carnivore"
    case cat = "Cat"
    case dog = "Dog"
    case extinct = "Extinct"
    case farm = "Farm"
    case fast = "Fast"
    case herbivore = "Herbivore"
    case insect = "Insect"
    case mammal = "Mammal"
    case mollusc = "Mollusc"
    case mythical = "Mythical"
    case ominvore = "Omnivore"
    case pet = "Pet"
    case primate = "Primate"
    case reptile = "Reptile"
    case scavenger = "Scavenger"
    case secret = "Secret"
    case small = "Small"
    case snow = "Snow"
    case special = "Special"
    case strong = "Strong"
    case tasty = "Tasty"
    case wild = "Wild"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum GenomeFilter: String, Equatable, CaseIterable {
    case academic = "Academic"
    case administration = "Administration"
    case business = "Business"
    case creative = "Creative"
    case curious = "Curious"
    case enchanted = "Enchanted"
    case evil = "Evil"
    case explorers = "Explorers"
    case hospitality = "Hospitality"
    case law = "Law"
    case media = "Media"
    case medical = "Medical"
    case music = "Music"
    case performers = "Performers"
    case production = "Production"
    case resident = "Resident"
    case services = "Services"
    case special = "Special"
    case sports = "Sports"
    case technical = "Technical"
    case transport = "Transport"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum BuildingFilter: String, Equatable, CaseIterable {
    case administration = "Administration"
    case business = "Business"
    case creative = "Creative"
    case entertainment = "Entertainment"
    case fb = "F&B"
    case science = "Science"
    case services = "Services"
    case none = "None"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum AnimalFilter: String, Equatable, CaseIterable {
    case parrot = "Parrot"
    case mouse = "Mouse"
    case bull = "Bull"
    case spider = "Spider"
    case squirrel = "Squirrel"
    case mccaw = "McCaw"
    case snake = "Snake"
    case trout = "Trout"

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum ProfessionFilter: String, Equatable, CaseIterable {
    case mayor = "Mayor"
    case mechanic = "Mechanic"
    case engineer = "Engineer"
    case sheriff = "Sheriff"
    case architect = "Architect"
    case landscaper = "Landscaper"
    case deputy = "Deputy"
    case gardener = "Gardener"
    case mechanicalEngineer = "Mechanical Engineer"
    case botanist = "Botanist"
    case parkRanger = "Park Ranger"
    case firefighter = "Firefighter"
    case farmer = "Farmer"
    case doctor = "Doctor"
    case nurse = "Nurse"
    case policeOfficer = "Police Officer"
    case vet = "Vet"
    case homemaker = "Homemaker"
    case zoologist = "Zoologist"
    case plumber = "Plumber"
    case fishmonger = "Fishmonger"
    case animalTrainer = "Animal Trainer"
    case milkmonger = "Milkmonger"
    case artist = "Artist"
    case photographer = "Photographer"
    case dentist = "Dentist"
    case radiologist = "Radiologist"
    case cook = "Cook"
    case chef = "Chef"
    case zookeeper = "Zookeeper"
    case constructionWorker = "Contruction Worker"
    case carDesigner = "Car Designer"
    case athlete = "Athlete"
    case greengrocer = "Greengrocer"
    case interiorDesigner = "Interior Designer"
    case olympicSwimmer = "Olympic Swimmer"
    case painter = "Painter"
    case hotelManager = "Hotel Manager"
    case valet = "Valet"
    case pilot = "Pilot"
    case flightAttendant = "Flight Attendant"
    case aerospaceEngineer = "Aerospace Engineer"
    case artDealer = "Art Dealer"
    case industrialist = "Industrialist"
    case jockey = "Jockey"
    case marineBiologist = "Marine Biologist"
    case realEstateAgent = "Real Estate Agent"
    case soldier = "Soldier"
    case waiter = "Waiter"
    case philosopher = "Philosopher"
    case detective = "Dectective"
    case lawyer = "Lawyer"
    case marine = "Marine"
    case judge = "Judge"
    case secretary = "Secretary"
    case writer = "Writer"
    case poet = "Poet"
    case paramedic = "Paramedic"
    case lifeguard = "Lifeguard"
    case model = "Model"
    case swimsuitModel = "Swimsuit Model"
    case reporter = "Reporter"
    case balletDancer = "Ballet Dancer"
    case martialArtist = "Martial Artist"
    case sushiChef = "Sushi Chef"
    case foodCritic = "Food Critic"
    case general = "General"
    case actor = "Actor"
    case flightController = "Flight Controller"
    case calligrapher = "Calligrapher"
    case cameraman = "Cameraman"
    case cheerleader = "Cheerleader"
    case coach = "Coach"
    case courier = "Courier"
    case director = "Director"
    case florist = "Florist"
    case gravedigger = "Gravedigger"
    case mailman = "Mailman"
    case miner = "Miner"
    case cattleRustler = "Cattle Rustler"
    case postmasterGeneral = "Postmaster General"
    case stuntDouble = "Stunt Double"
    case programmer = "Programmer"
    case gameDesigner = "Game Designer"
    case mathematician = "Mathematician"
    case scientist = "Scientist"
    case physicist = "Physicist"
    case astronomer = "Astronomer"
    case astronaut = "Astronaut"
    case geneticist = "Geneticist"
    case cryptozoologist = "Cryptozoologist"
    case accountant = "Accountant"
    case editor = "Editor"
    case librarian = "Librarian"
    case historian = "Historian"
    case archaeologist = "Archaeologist"
    case superHero = "Super Hero"
    case atomicHero = "Atomic Hero"
    case ancientHero = "Ancient Hero"
    case choreographer = "Choreographer"
    case pharmacist = "Pharmacist"
    case csi = "CSI"
    case forensicScientist = "Forensic Scientist"
    case physiotherapist = "Physiotherapist"
    case coroner = "Coroner"
    case antiHero = "Anti Hero"
    case wrestler = "Wrestler"
    case clown = "Clown"
    case paleontologist = "Paleontologist"
    case geologist = "Geologist"
    case breakDancer = "Break Dancer"
    case captain = "Captain"
    case weatherReporter = "Weather Reporter"
    case comic = "Comic"
    case discJockey = "Disc Jockey"
    case firstMate = "First Mate"
    case buccaneer = "Buccaneer"
    case preacher = "Preacher"
    case rapper = "Rapper"
    case receptionist = "Receptionist"
    case songwriter = "Songwriter"
    case taxidermist = "Taxidermist"
    case vocalist = "Vocalist"
    case assistant = "Assistant"
    case footballer = "Footballer"
    case shepherd = "Shepherd"
    case winemaker = "Winemaker"
    case baker = "Baker"
    case carpenter = "Carpenter"
    case janitor = "Janitor"
    case ninja = "Ninja"
    case referee = "Referee"
    case secretAgent = "Secret Agent"
    case sensei = "Sensei"
    case deepSeaDiver = "Deep Sea Diver"
    case watchmaker = "Watchmaker"
    case timeTraveller = "Time Traveller"
    case tailor = "Tailor"
    case ringmaster = "Ringmaster"
    case oracle = "Oracle"
    case matador = "Matador"
    case magician = "Magician"
    case bartender = "Bartender"
    case barista = "Barista"
    case wizard = "Wizard"
    case apprentice = "Apprentice"
    case systemAdmin = "System Admin"
    case genie = "Genie"
    case weddingPlanner = "Wedding Planner"
    case centaur = "Centaur"
    case weddingSinger = "Wedding Singer"
    case jeweller = "Jeweller"
    case chocolatier = "Chocolatier"
    case matchmaker = "Matchmaker"
    case datingAdvisor = "Dating Advisor"
    case politician = "Politician"
    case civilServant = "Civil Servant"
    case officer = "Officer"
    case insuranceAgent = "Insurance Agent"
    case federalAgent = "Federal Agent"
    case conductor = "Conductor"
    case drummer = "Drummer"
    case bassist = "Bassist"
    case guitarist = "Guitarist"
    case pianist = "Pianist"
    case violinist = "Violinist"
    case gamer = "Gamer"
    case basketballer = "Basketballer"
    case baseballer = "Baseballer"
    case soccerStar = "Soccer Star"
    case tennisPlayer = "Tennis Player"
    case golfer = "Golfer"
    case caddie = "Caddie"
    case racecarDriver = "Racecar Driver"
    case mascot = "Mascot"
    case figureSkater = "Figure Skater"
    case skier = "Skier"
    case mountainClimber = "Mountain Climber"
    case iceFisher = "Ice Fisher"
    case pizzaGuy = "Pizza Guy"
    case sommelier = "Sommelier"
    case iceCreamSeller = "Ice Cream Seller"
    case celebrityChef = "Celebrity Chef"
    case butler = "Butler"
    case cosmeticSurgeon = "Cosmetic Surgeon"
    case cardiologist = "Cardiologist"
    case bouncer = "Bouncer"
    case partyAnimal = "Party Animal"
    case gambler = "Gambler"
    case croupier = "Croupier"
    case investor = "Investor"
    case bodybuilder = "Bodybuilder"
    case gymInstructor = "Gym Instructor"
    case sumoWrestler = "Sumo Wrestler"
    case samurai = "Samurai"
    case gymnast = "Gymnast"
    case boxer = "Boxer"
    case acrobat = "Acrobat"
    case professor = "Professor"
    case talkshowHost = "Talkshow Host"
    case newsAnchor = "News Anchor"
    case entrepreneur = "Entrepreneur"
    case travelAgent = "Travel Agent"
    case tourGuide = "Tour Guide"
    case cyclist = "Cyclist"
    case skateboarder = "Skateboarder"
    case treehugger = "Treehugger"
    case starCommander = "Star Commander"
    case mountedPolice = "Mounted Police"
    case tourist = "Tourist"
    case catcher = "Catcher"
    case statistician = "Statistician"
    case ventrilogquist = "Ventrilogquist"
    case masseuse = "Masseuse"
    case chemist = "Chemist"
    case hazmat = "Hazmat"
    case investmentBanker = "Investment Banker"
    case mime = "Mime"
    case optometrist = "Optometrist"
    case surfer = "Surfer"
    case butcher = "Butcher"
    case hockeyPlayer = "Hockey Player"
    case sportsFan = "Sports Fan"
    case lumberjack = "Lumberjack"
    case pyrotechnician = "Pyrotechnician"
    case tattooArtist = "Tattoo Artist"
    case biker = "Biker"
    case gasFiller = "Gas Filler"
    case carWasher = "Car Washer"
    case hairStylist = "Hair Stylist"
    case seaDog = "Sea Dog"
    case sailor = "Sailor"
    case dockHand = "Dock Hand"
    case boatRacer = "Boat Racer"
    case sailingInstructor = "Sailing Instructor"
    case lighthouseKeeper = "Lighthouse Keeper"
    case cartographer = "Cartographer"
    case castaway = "Castaway"
    case tribal = "Tribal"
    case treasureHunter = "Treasure Hunter"
    case mermaid = "Mermaid"
    case musketeer = "Musketeer"
    case emperor = "Emperor"
    case fencer = "Fencer"
    case lawnGnome = "Lawn Gnome"
    case punkRocker = "Punk Rocker"
    case mariachi = "Mariachi"
    case rockstar = "Rockstar"
    case electrician = "Electrician"
    case telephoneOperator = "Telephone Operator"
    case cashier = "Cashier"
    case beeKeeper = "Bee Keeper"
    case entomologist = "Entomologist"
    case bellRinger = "Bell Ringer"
    case securityGuard = "Security Guard"
    case minotaur = "Minotaur"
    case toothFairy = "Tooth Fairy"
    case eagleScout = "Eagle Scout"
    case campCounsellor = "Camp Counsellor"
    case outlaw = "Outlaw"
    case caveman = "Caveman"
    case crashtestDummy = "Crashtest Dummy"
    case oilDriller = "Oil Driller"
    case vigilante = "Vigilante"
    case rockClimber = "Rock Climber"
    case welder = "Welder"
    case oilBaron = "Oil Baron"
    case barber = "Barber"
    case acapellaSinger = "Acapella Singer"
    case merchant = "Merchant"
    case ambassador = "Ambassador"
    case vampire = "Vampire"
    case monster = "Monster"
    case werewolf = "Werewolf"
    case mummy = "Mummy"
    case madScientist = "Mad Scientist"
    case henchman = "Henchman"
    case supervillain = "Supervillain"
    case thief = "Thief"
    case assassin = "Assassin"
    case bandit = "Bandit"
    case arsonist = "Arsonist"
    case ceo = "CEO"
    case ghost = "Ghost"
    case skeleton = "Skeleton"
    case witch = "Witch"
    case troll = "Troll"
    case jackOLantern = "Jack-O-Lantern"
    case slasher = "Slasher"
    case overlord = "Overlord"
    case monsterHunter = "Monster Hunter"
    case exterminator = "Exterminator"
    case cyclops = "Cyclops"
    case iceLord = "Ice Lord"
    case guardian = "Guardian"
    case snowElemental = "Snow Elemental"
    case sherpa = "Sherpa"
    case alpineRescue = "Alpine Rescue"
    case snowboarder = "Snowboarder"
    case toyMaker = "Toy Maker"
    case elf = "Elf"
    case toySoldier = "Toy Soldier"
    case viking = "Viking"
    case regent = "Regent"
    case successor = "Successor"
    case bigBadWolf = "Big Bad Wolf"
    case puppet = "Puppet"
    case jungleDweller = "Jungle Dweller"
    case swashbuckler = "Swashbuckler"
    case hoodedRider = "Hooded Rider"
    case piper = "Piper"
    case knight = "Knight"
    case adventurer = "Adventurer"
    case sculptor = "Sculptor"
    case beanFarmer = "Bean Farmer"
    case giant = "Giant"
    case wonderlander = "Wonderlander"
    case gingerbreadClone = "Gingerbread Clone"
    case submariner = "Submariner"
    case gladiator = "Gladiator"
    case sunPriest = "Sun Priest"
    case dwarf = "Dwarf"
    case hermit = "Hermit"
    case hairModel = "Hair Model"
    case housekeeper = "Housekeeper"
    case shoeMaker = "Shoe Maker"
    case baseJumper = "Base Jumper"
    case playwright = "Playwright"
    case perfumeMaker = "Perfume Maker"
    case bard = "Bard"
    case newlywed = "Newlywed"
    case blacksmith = "Blacksmith"
    case freedomFighter = "Freedom Fighter"
    case metalhead = "Metalhead"
    case juggler = "Juggler"
    case bagpiper = "Bagpiper"
    case trainConductor = "Train Conductor"
    case makeupArtist = "Makeup Artist"
    case engineDriver = "Engine Driver"
    case warrior = "Warrior"
    case onlineShopper = "Online Shopper"
    case forester = "Forester"
    case cliffDiver = "Cliff Diver"
    case yogaInstructor = "Yoga Instructor"
    case dogWalker = "Dog Walker"
    case whiskyBlender = "Whisky Blender"
    case frisbeePlayer = "Frisbee Player"
    case graffitiArtist = "Graffiti Artist"
    case organicFarmer = "Organic Farmer"
    case juicer = "Juicer"
    case balloonTwister = "Balloon Twister"
    case manicurist = "Manicurist"
    case indieMusician = "Indie Musician"
    case auctioneer = "Auctioneer"
    case barbarian = "Baarbarian"
    case monk = "Monk"
    case cleric = "Cleric"
    case paladin = "Paladin"
    case dragonTamer = "Dragon Tamer"
    case rogue = "Rogue"
    case necromancer = "Necromancer"
    case dreamer = "Dreamer"
    case salesman = "Salesman"
    case explorer = "Explorer"
    case mutant = "Mutant"
    case romantic = "Romantic"
    case bureaucrat = "Bureaucrat"
    case musician = "Musician"
    case sportsStar = "Sports Star"
    case jackFrost = "Jack Frost"
    case foodie = "Foodie"
    case socialite = "Socialite"
    case strongman = "Strongman"
    case guru = "Guru"
    case hitchHiker = "Hitch Hiker"
    case abomination = "Abomination"
    case holidaySpirit = "Holiday Spirit"
    case fairyGodmother = "Fairy Godmother"
    case crusader = "Crusader"
    case amazon = "Amazon"
    case hipster = "Hipster"
    case rolePlayer = "Role Player"

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum TierFilter: String, Equatable, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum Property: String, Equatable, CaseIterable {
    case season = "Season"
    case category = "Category"
    case tier = "Tier"
    case parent = "Parent"
    case genome = "Genome"
    case clone = "Clone"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

public protocol EnumConvertible: Hashable {
    init?(hashValue hash: Int)
    static func countMembers() -> Int
    static func members() -> [Self]
}

extension EnumConvertible where Self:Hashable {
    internal static func fromHash(hashValue index: Int) -> Self {
        let member = unsafeBitCast(UInt8(index), to: Self.self)
        return member
    }
    
    static public func countMembers() -> Int {
        // Cannot add storage to protocol at this time, so this gets computed each call
        let byteCount = MemoryLayout.size(ofValue: self)
        if byteCount == 0 {return 8}
        print("byteCount = \(MemoryLayout.size(ofValue: Int.self))")
        if byteCount > 16 {fatalError("Unable to process enumeration, byteCount = \(byteCount)")}
        let singleByte = byteCount == 8
        let minValue = singleByte ? 2 : 2049
        let maxValue = singleByte ? 2 << 8: 2 << 16
        for hashIndex in minValue..<maxValue {
            switch singleByte {
            case true:
                if unsafeBitCast(UInt8(hashIndex), to: self).hashValue == 0 {
                    return hashIndex
                }
            case false:
                if unsafeBitCast(UInt16(hashIndex), to: self).hashValue == 0 {
                    return hashIndex
                }
            }
        }
        return maxValue
    }
    
    static public func members() -> [Self] {
        var enumerationMembers = [Self]()
  //      let singleByte = MemoryLayout.size(ofValue: self) == 1
        for index in 0..<4294967296 {
   //     for index in 0..<Self.countMembers() {
  //          switch singleByte {
  //          case true:
                let member = unsafeBitCast(UInt64(index), to: self)
                enumerationMembers.append(member)
  //          case false:
   //             let member = unsafeBitCast(UInt16(index), to: self)
   //             enumerationMembers.append(member)
   //         }
        }
        return enumerationMembers
    }

    public init?(hashValue hash: Int) {
        if hash >= 4294967296 {return nil}
   //     if hash >= Self.countMembers() {return nil}
        self = Self.fromHash(hashValue: hash)
    }
}

