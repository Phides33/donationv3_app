class Profile < ApplicationRecord

  enum amount_bracket: ["moins de 50€", "moins de 100€", "moins de 200€",
    "moins de 500€", "500€ et plus" ]

  validates :amount_bracket, presence: true, inclusion: { in: :amount_bracket,
    message: "Vous devez sélectionner un des choix" }
end
