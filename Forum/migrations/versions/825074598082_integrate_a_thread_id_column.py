"""Integrate a thread_id column

Revision ID: 825074598082
Revises: b42282c9d23f
Create Date: 2020-07-28 06:48:20.534512

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '825074598082'
down_revision = 'b42282c9d23f'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('comments', sa.Column('thread_id', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'comments', 'threads', ['thread_id'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'comments', type_='foreignkey')
    op.drop_column('comments', 'thread_id')
    # ### end Alembic commands ###
