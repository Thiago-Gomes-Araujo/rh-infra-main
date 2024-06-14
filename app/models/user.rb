class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:cpf]

  # Serve para validar o perfil do usuário ex: Current_user.g_tipo_usuario_id == User::CRE
  COMUM = 1
  CRE = 2
  ESCOLA = 3
  OUTRAS_SECRETARIAS = 4

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, authentication_keys: [:cpf]
  # Variáveis temporárias
  attr_accessor :update_password
  attr_accessor :temp_password
  attr_accessor :update_password_request

  # Para fotos
  has_one_attached :photo

  # Relações
  belongs_to :g_secretaria
  belongs_to :g_cre, optional: true
  belongs_to :i_predio, optional: true
  belongs_to :g_tipo_usuario
  
  # Validates
  validates :cpf, presence: true, uniqueness: { scope: :deleted_at, conditions: -> { where(deleted_at: nil) } }
  validates :nome, presence: true, uniqueness: { scope: :deleted_at, conditions: -> { where(deleted_at: nil) } }
  validates :email, presence: true, uniqueness: { scope: :deleted_at, conditions: -> { where(deleted_at: nil) } }
  validate :custom_validates
  validates :password, presence: true, if: -> { update_password_request.present? }
  validates :password_confirmation, presence: true, if: -> { update_password_request.present? }

  # Before_create
  before_create :set_new_password

  # Before update
  before_update :update_password_user
  before_update :update_password

  # After_create
  after_create :send_email_new_user

  # Validação de CPF válido
  def cpf=(cpf)
    super cpf = cpf.gsub(/[.-]/, "")
  end

  private 
  
  def custom_validates
    unless CPF.valid?(cpf)
      errors.add(:cpf, "não é válido")
    end  
    
    if i_predio.present? and g_cre_id != i_predio.g_cre_id      
      if g_cre          
        errors.add(:g_cre, "deve ser a mesma do prédio selecionado")                    
        errors.add(:i_predio, "não pertence a CRE selecionada")
      else
        errors.add(:g_cre, "deve ser a mesma do prédio selecionado")
      end
    end
  end

  # Método para gerar e enviar email para usuário ao ser criado.
  def set_new_password
    # Gera uma senha temporária de 8 caracteres.
    temp_password = Devise.friendly_token[0, 8]

    # salva nos campos do devise a tenha que será salva no banco.
    self.password = temp_password
    self.password_confirmation = temp_password
    self.password_change_required = true

    # variável criada para salvar a senha temporária para ser enviada após a criação.
    self.temp_password = temp_password
  end
  
  # Ao criar o usuário, o sistema deve enviar o email com os dados de acesso.
  def send_email_new_user
    # Objeto montado para o @body a fim de ser utilizado no html.
    user_values = { name: self.nome, password_temp: self.temp_password }
  
    #Layout.
    layout = 'main_mailer/send_password'
    
    # Assunto.
    subject = I18n.t('devise.passwords.send_password')
  
    # Dispara o email para o usuário
    MainMailer.send_new_password(layout, subject, self.email, user_values).deliver_now
  end

  # Caso o usuário esteja trocando sua senha do primeiro acesso, modifico a flag.
  def update_password_user
    return true if self.update_password.nil?
    self.password_change_required = false
  end

  def update_password
    return true if self.update_password_request.nil?
    if self.password != self.password_confirmation
     errors.add(:base, "As senhas não conferem!")
     throw(:abort)
    end
  end
end
  