class SpendsController < ApplicationController
  # GET /spends
  # GET /spends.xml
  def index
    @spends = Spend.all(:order => 'amount DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spends }
    end
  end

  # GET /spends/1
  # GET /spends/1.xml
  def show
    @spend = Spend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spend }
    end
  end

  # GET /spends/new
  # GET /spends/new.xml
  def new
    @spend = Spend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spend }
    end
  end

  # GET /spends/1/edit
  def edit
    @spend = Spend.find(params[:id])
  end

  # POST /spends
  # POST /spends.xml
  def create
    @spend = Spend.new(params[:spend])

    respond_to do |format|
      if @spend.save
        flash[:notice] = 'Spend was successfully created.'
        format.html { redirect_to(@spend) }
        format.xml  { render :xml => @spend, :status => :created, :location => @spend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spends/1
  # PUT /spends/1.xml
  def update
    @spend = Spend.find(params[:id])

    respond_to do |format|
      if @spend.update_attributes(params[:spend])
        flash[:notice] = 'Spend was successfully updated.'
        format.html { redirect_to(@spend) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spends/1
  # DELETE /spends/1.xml
  def destroy
    @spend = Spend.find(params[:id])
    @spend.destroy

    respond_to do |format|
      format.html { redirect_to(spends_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    spend_xml = File.read('public/supplierspend2010Q2.xml')
    spend_hash = Hash.from_xml(spend_xml)
    logger.info("--- spend_hash: #{spend_hash['supplier_spend']['periods']}")
    start = spend_hash['supplier_spend']['periods']['period']['start']
    end_date = spend_hash['supplier_spend']['periods']['period']['end']
    spend_hash['supplier_spend']['periods']['period']['record'].each do |tree|
      @spend = Spend.new()
      @spend.ref = tree['ref']
      @spend.supplier = tree['supplier']
      @spend.amount = tree['amount']
      @spend.start_date = start
      @spend.end_date = end_date
      @spend.save!
    end
    redirect_to(spends_url)
  end
end
